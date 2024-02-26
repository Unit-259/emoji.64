function Emoji64 {

<#
	.SYNOPSIS
	Encodes a message using emojis based on a specified pattern.

	.DESCRIPTION
	This function encodes a message into a sequence of emojis using a custom pattern. It imports the 'emoji' module to map ASCII characters from the message to corresponding emojis based on the specified pattern.

	.PARAMETER Message
	Specifies the message to be encoded into emojis.

	.PARAMETER Pattern
	Specifies the pattern of emojis to be used for encoding the message. The function selects emojis from this pattern to represent ASCII characters in the message.

	.PARAMETER indexStart
	Specifies the starting index in the emoji pattern from which to begin encoding. Defaults to 0.

	.EXAMPLE
	Emoji64 -Message 'this is the secret message!' -Pattern 'music' -indexStart 2

	This example encodes the message 'this is the secret message!' into emojis using the 'music' pattern, starting from the third emoji in the pattern.

	.NOTES
	This function requires the 'emoji' module to be installed. You can install it using the following command:
	Install-Module -Name emoji

	.LINK
	https://github.com/StartAutomating/Emoji
	
	.LINK
	https://github.com/Unit-259/emoji.64
#>

    param (
        [string]$Message,
        [string]$Pattern,
		[int]$indexStart = 0
    )

    # Determine the starting and ending indices for selecting emojis from the pattern
    $indexEnd = $indexStart + 63

	  $message = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($message)) 

    # Retrieve the emojis corresponding to the selected indices
    $mapKeys = ((Find-Emoji -Pattern $Pattern)[$indexStart..$indexEnd]).Emoji

    # Map ASCII characters from the message to the retrieved emojis
    $encodedMessage = foreach ($char in $Message.ToCharArray()) {
        $asciiValue = [int][char]$char
        if ($asciiValue -ge 32 -and $asciiValue -le 126) {
            $musicNoteIndex = ($asciiValue - 32) % $mapKeys.Count
            $mapKeys[$musicNoteIndex]
        } else {
            $char
        }
    }

    # Output the encoded message
    return $encodedMessage -join ''
}
