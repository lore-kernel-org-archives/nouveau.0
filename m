From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Questions on syncing mechanisms
Date: Sun, 9 Jun 2019 12:10:25 -0400
Message-ID: <CA+MSTo_dCwtDxwT+2z__8gKayXmMmpGox_rVTMT-9QYoJkZa7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0182240893=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0182240893==
Content-Type: multipart/alternative; boundary="000000000000d18184058ae64d83"

--000000000000d18184058ae64d83
Content-Type: text/plain; charset="UTF-8"

So I have been implementing syncing mechanisms to yuzu's switch emulator,
aka Tegra X1 emulation and I already have: Semaphores, Syncpoints and
Queries to some extent. I'm missing the barriers (GPU waits for CPU):
I got this from RE:
Barrier mode has priority (from highest to lowest): 1) 0x08 sets needsWfi=0
-> highest priority, does puller refcnt + split(0,0) + 0x100 NoOperation +
rest of cmds + split(1,1) 2) 0x01 sets needsWfi=0 -> uses 0x0110
Serialize/"WaitForIdle" 3) 0x02 sets needsWfi=1 -> uses 0xDE0 (??) 4) 0x04
sets needsWfi=1 -> uses 0xF7C (??) <-- tile related? Used by
nvnQueue_ctrlTiledDownsample 5) nothing; sets needsWfi=0
 Do you guys know any info on this and how the GPU must behave in each
situation. For instance, on Serialize, what should the GPU be waiting for?
I do know you guys use that one not sure on the rest.

--000000000000d18184058ae64d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So I have been implementing syncing mechanisms to yuzu&#39=
;s switch emulator, aka Tegra X1 emulation and I already have: Semaphores, =
Syncpoints and Queries to some extent. I&#39;m missing the barriers (GPU wa=
its for CPU):<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"></div><div>I got this from RE:</div><div><span style=3D"col=
or:rgb(131,148,150);font-family:Consolas,&quot;Liberation Mono&quot;,Menlo,=
Courier,monospace;font-size:14px;white-space:pre-wrap;background-color:rgb(=
47,49,54)">Barrier mode has priority (from highest to lowest):

 1) 0x08 sets needsWfi=3D0 -&gt; highest priority, does puller refcnt + spl=
it(0,0) + 0x100 NoOperation + rest of cmds + split(1,1)
 2) 0x01 sets needsWfi=3D0 -&gt; uses 0x0110 Serialize/&quot;WaitForIdle&qu=
ot;
 3) 0x02 sets needsWfi=3D1 -&gt; uses 0xDE0 (??)
 4) 0x04 sets needsWfi=3D1 -&gt; uses 0xF7C (??) &lt;-- tile related? Used =
by nvnQueue_ctrlTiledDownsample
 5) nothing; sets needsWfi=3D0</span>=C2=A0</div><div>=C2=A0Do you guys kno=
w any info on this and how the GPU must behave in each situation. For insta=
nce, on Serialize, what should the GPU be waiting for? I do know you guys u=
se that one not sure on the rest.<br></div></div>

--000000000000d18184058ae64d83--

--===============0182240893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0182240893==--
