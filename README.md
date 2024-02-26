# emoji.64

## Description

Emoji64 is a PowerShell function that encodes a message into a sequence of emojis based on a specified pattern. It imports the 'emoji' module to map ASCII characters from the message to corresponding emojis based on the specified pattern.

## Installation

To use Emoji64, you need to first install the ['emoji' module](https://github.com/StartAutomating/Emoji). You can install it using the following PowerShell command:

```powershell
Install-Module -Name emoji
```

Then install the ['emoji.64' module](https://github.com/Unit-259/emoji.64). You can install it using the following PowerShell command:

```powershell
Install-Module -Name emoji.64
```

## Parameters

- **Message**: Specifies the message to be encoded into emojis.
- **Pattern**: Specifies the pattern of emojis to be used for encoding the message. The function selects emojis from this pattern to represent ASCII characters in the message.
- **indexStart**: Specifies the starting index in the emoji pattern from which to begin encoding. Defaults to 0.

## Example

```powershell
Emoji64 -Message 'this is the secret message!' -Pattern 'music' -indexStart 2
```

### RETURNS

```powershell
᭭𝀍᭩᭣᭱᭴𝂚᭣᭱᭴𝂚᭣᭯𝀍𝃫᭧᭱᭻𝃭᭪᭱᭨𝃭᭣𝂅𝀍᭺᭢᭱᭸𝀑᭩𝃮᭻𝃫᭩
```
