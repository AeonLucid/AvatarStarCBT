# AvatarStarCBT

This is a work in progress private server for the game Avatar Star.  
The version targeted is a closed beta test held in 2013.

## Notes

### Unpack client.exe

The main client executable is packed by Apex Protect, to unpack place a breakpoint on `0x0116606D jmp eax`.  
Here `eax` holds the original entrypoint (OEP), which is `0x00B068B5`.  
Dump the executable from memory, and fix the dump with scylla using these settings.

```
OEP  00B068B5
VA   00B9A000
Size 000004E0
```

### Disable anti cheat

The game has an anti cheat named avital / apex protect.  
You need to disable it by replacing `E8 9E 1E 00 00` with `90 90 90 90 90` inside `client.exe`.  

## Why

I don't know.
