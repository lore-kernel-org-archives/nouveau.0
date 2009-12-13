From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: *ERROR* EDID checksum is invalid
Date: Mon, 14 Dec 2009 00:19:31 +0100
Message-ID: <91752840912131519r5a333b61k53c6a000a03bef79@mail.gmail.com>
References: <91752840912131444t9f57fb5q369266c9a32e557e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752840912131444t9f57fb5q369266c9a32e557e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Dec 13, 2009 at 11:44 PM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Another apparently harmless message.. But I find it quite curious.
> Especially that they seem pretty harmful in the case of
> http://bugs.freedesktop.org/show_bug.cgi?id=25393
>
> So my setup is nv35 with a 19' CRT screen connected to vga output.
> I get random occurrences of this message :
> [drm:edid_is_valid] *ERROR* EDID checksum is invalid, remainder is 161
> [drm:edid_is_valid] *ERROR* Raw EDID:
>
> But I do not get any of the bad symptoms described in bug 25393 : no
> crashes, no screen deactivation, no corruption (though I did not
> manage to make suspend-to-ram work yet). On the other hand, I do not
> use that box much, so maybe I don't use it enough to get/see all the
> bad symptoms.
>
> And in my case, I doubt the raw edid is valid as it seems different
> every time (and the remainder too).
>
> I just made a fresh boot, with X started automatically. The error did
> not occur. Then I restarted X (init 3 ; init 5) and it appeared. The
> corresponding kernel log is attached.
>
> I just had a look at the different EDID I got, and put 5 of them in a
> file. It actually looks like 1 2 3 and 5 are the same EDID, but they
> all seem to be cut, at a different place. I guess they would be valid
> otherwise as I can see my screen model : MM904U
> The 4th one is completely different though, but it happened right
> after I played with gallium, got a lot of errors and X lock and killed
> X.
>
> So I guess I have mainly two questions, out of curiosity :
> 1) why does the edid seem to be randomly cut ?
> 2) why doesn't it have any apparent bad effects other than an error in
> kernel log ?
>

I just managed to get my complete edid using the read-edid tool.
After unloading nouveau (it didnt work otherwise), I did get-edid | hexdump -C

00000000  00 ff ff ff ff ff ff 00  26 cd 44 19 3f 40 00 00  |........&.D.?@..|
00000010  2c 0e 01 03 68 24 1b 78  2a 76 14 a0 56 47 99 26  |,...h$.x*v..VG.&|
00000020  12 48 4c a4 43 00 31 59  45 59 61 59 81 59 81 99  |.HL.C.1YEYaY.Y..|
00000030  a9 4f 01 01 01 01 86 3d  00 c0 51 00 30 40 40 a0  |.O.....=..Q.0@@.|
00000040  13 00 68 0e 11 00 00 1e  ea 24 00 60 41 00 28 30  |..h......$.`A.(0|
00000050  30 60 13 00 68 0e 11 00  00 1e 00 00 00 fc 00 4d  |0`..h..........M|
00000060  4d 39 30 34 55 0a 20 20  20 20 20 20 00 00 00 fd  |M904U.      ....|
00000070  00 32 a0 1e 60 14 00 0a  20 20 20 20 20 20 00 23  |.2..`...      .#|
00000080

Is it just some timing issue or something ?
