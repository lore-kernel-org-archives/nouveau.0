From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PREVIEW] GM200/GM204 signed firmware for Nouveau
Date: Mon, 15 Feb 2016 19:59:06 +1000
Message-ID: <CACAvsv5qv029Cv=eeqnMPbtXsEQ9HJRt1sqg-rnN8uc-uQc46A@mail.gmail.com>
References: <56C18F11.9040003@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0275497636=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56C18F11.9040003@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0275497636==
Content-Type: multipart/alternative; boundary=047d7b6dc06e3f3749052bcc1184

--047d7b6dc06e3f3749052bcc1184
Content-Type: text/plain; charset=UTF-8

On 15 Feb 2016 18:40, "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>
> Hi everyone,
>
> I know, it's about f**king time and I apologize for the time it took us
to finally put this together. m(__)m
>
> I have pushed two git branches which enable GM200 and GM204 (GM206 to
follow soon) owners to finally load NVIDIA-provided signed firmware and
start GR:
>
> - https://github.com/Gnurou/linux-firmware/tree/secboot contains the
signed firmware for GM200 and GM204 (they are mostly the same). For each
chip, "gr" contains the signed firmware for GR, and "acr" the signed
firmware loader. ACR stands for Access Controlled Regions and is a secure
firmware that runs on the PMU and is responsible for setting up a
write-protected (WPR) region in VRAM where the other signed firmware can be
verified and loaded without anyone tampering it. The ACR itself is also
signed and verified by the hardware. More details on the signed firmware
loading process can be found at
ftp://download.nvidia.com/open-gpu-doc/Falcon-Security/1/Falcon-Security.html
.
>
> This ACR binary is currently custom-built for Nouveau and allows to only
load GR. This means that other falcons which require signed firmware (like
PMU) cannot be used as of now. Our goal is to eventually have Nouveau use
the same firmware as our own driver (RM), but this will take some more
work. One of the obstacles being that since RM embeds the firmware, both
can safely evolve in lockstep, while in the context of Nouveau we must make
sure older kernels remain supported forever and either avoid incompatible
changes or manage different firmware versions.
>
> - https://github.com/Gnurou/nouveau/tree/secboot is a Nouveau branch
capable of loading the signed firmware. The patches are mostly in good
shape and I hope that they will be merged once we iron out the last details
about the firmware format, hopefully in time for 4.6. I still have issues
with suspend/resume (module unload/reload works fine though) but hope to
sort this out soon.
>
> To test this, checkout my linux-firmware secboot branch and copy it to
/lib/firmware, then build Nouveau from the secboot branch of my repo and
load it. If your console switches to nouveaufb and you don't see Nouveau
complaining about ACR boot failing, congratulations! GR is now ready to
work. You won't go much further though unless you can add support for
Maxwell 2 into Mesa - but the changes for basic support are rather modest,
and hopefully this pre-release will be enough to enable patches to land in
Mesa.
>
> An official submit to linux-firmware will happen once we agree on the
final firmware format and the kernel code is good to go. For now, please
consider these branches as work-in-progress and do not distribute them or
embed them anywhere to avoid compatiblity issues. Also update both together
I as will heavily rebase in the next few days.
>
> So while we have still some work ahead, this at least unlocks a very
unpleasant situation for everyone, and we will take further steps to keep
improving it.
>
> Please test, hack Mesa, and comment on the kernel code so that we can get
all this in time for 4.6! :)
Thanks for this Alex!

I'll attempt to post the Mesa patches tomorrow to get the ball rolling :)

Ben.

>
> Cheers,
> Alex.
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--047d7b6dc06e3f3749052bcc1184
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 15 Feb 2016 18:40, &quot;Alexandre Courbot&quot; &lt;<a h=
ref=3D"mailto:acourbot@nvidia.com">acourbot@nvidia.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi everyone,<br>
&gt;<br>
&gt; I know, it&#39;s about f**king time and I apologize for the time it to=
ok us to finally put this together. m(__)m<br>
&gt;<br>
&gt; I have pushed two git branches which enable GM200 and GM204 (GM206 to =
follow soon) owners to finally load NVIDIA-provided signed firmware and sta=
rt GR:<br>
&gt;<br>
&gt; - <a href=3D"https://github.com/Gnurou/linux-firmware/tree/secboot">ht=
tps://github.com/Gnurou/linux-firmware/tree/secboot</a> contains the signed=
 firmware for GM200 and GM204 (they are mostly the same). For each chip, &q=
uot;gr&quot; contains the signed firmware for GR, and &quot;acr&quot; the s=
igned firmware loader. ACR stands for Access Controlled Regions and is a se=
cure firmware that runs on the PMU and is responsible for setting up a writ=
e-protected (WPR) region in VRAM where the other signed firmware can be ver=
ified and loaded without anyone tampering it. The ACR itself is also signed=
 and verified by the hardware. More details on the signed firmware loading =
process can be found at <a href=3D"ftp://download.nvidia.com/open-gpu-doc/F=
alcon-Security/1/Falcon-Security.html">ftp://download.nvidia.com/open-gpu-d=
oc/Falcon-Security/1/Falcon-Security.html</a> .<br>
&gt;<br>
&gt; This ACR binary is currently custom-built for Nouveau and allows to on=
ly load GR. This means that other falcons which require signed firmware (li=
ke PMU) cannot be used as of now. Our goal is to eventually have Nouveau us=
e the same firmware as our own driver (RM), but this will take some more wo=
rk. One of the obstacles being that since RM embeds the firmware, both can =
safely evolve in lockstep, while in the context of Nouveau we must make sur=
e older kernels remain supported forever and either avoid incompatible chan=
ges or manage different firmware versions.<br>
&gt;<br>
&gt; - <a href=3D"https://github.com/Gnurou/nouveau/tree/secboot">https://g=
ithub.com/Gnurou/nouveau/tree/secboot</a> is a Nouveau branch capable of lo=
ading the signed firmware. The patches are mostly in good shape and I hope =
that they will be merged once we iron out the last details about the firmwa=
re format, hopefully in time for 4.6. I still have issues with suspend/resu=
me (module unload/reload works fine though) but hope to sort this out soon.=
<br>
&gt;<br>
&gt; To test this, checkout my linux-firmware secboot branch and copy it to=
 /lib/firmware, then build Nouveau from the secboot branch of my repo and l=
oad it. If your console switches to nouveaufb and you don&#39;t see Nouveau=
 complaining about ACR boot failing, congratulations! GR is now ready to wo=
rk. You won&#39;t go much further though unless you can add support for Max=
well 2 into Mesa - but the changes for basic support are rather modest, and=
 hopefully this pre-release will be enough to enable patches to land in Mes=
a.<br>
&gt;<br>
&gt; An official submit to linux-firmware will happen once we agree on the =
final firmware format and the kernel code is good to go. For now, please co=
nsider these branches as work-in-progress and do not distribute them or emb=
ed them anywhere to avoid compatiblity issues. Also update both together I =
as will heavily rebase in the next few days.<br>
&gt;<br>
&gt; So while we have still some work ahead, this at least unlocks a very u=
npleasant situation for everyone, and we will take further steps to keep im=
proving it.<br>
&gt;<br>
&gt; Please test, hack Mesa, and comment on the kernel code so that we can =
get all this in time for 4.6! :)<br>
Thanks for this Alex! </p>
<p dir=3D"ltr">I&#39;ll attempt to post the Mesa patches tomorrow to get th=
e ball rolling :) </p>
<p dir=3D"ltr">Ben. </p>
<p dir=3D"ltr">&gt;<br>
&gt; Cheers,<br>
&gt; Alex.<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau@lists.freedesktop.org">Nouveau@lists.freedes=
ktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</p>

--047d7b6dc06e3f3749052bcc1184--

--===============0275497636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0275497636==--
