From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96876] system freeze "fifo: gr engine fault on
 channel 6" NVIDIA
Date: Sat, 23 Jul 2016 17:31:08 +0000
Message-ID: <bug-96876-8800-dShF5kwUBL@http.bugs.freedesktop.org/>
References: <bug-96876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1506947358=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96876-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1506947358==
Content-Type: multipart/alternative; boundary="14692950681.D11dA.22317";
 charset="UTF-8"


--14692950681.D11dA.22317
Date: Sat, 23 Jul 2016 17:31:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96876

--- Comment #5 from Ehsan Azar <dashesy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ok I am now running:

$ uname -a
Linux dashesy.wavelet 4.6.4-301.fc24.x86_64 #1 SMP Tue Jul 12 11:50:00 UTC =
2016
x86_64 x86_64 x86_64 GNU/Linux


Is this latest enough?
I am waiting to see if lockup happens again, but I am afraid I still see the
same kind of precursor:

$ journalctl --no-pager -b -p err
-- Logs begin at Thu 2016-05-05 05:39:48 PDT, end at Sat 2016-07-23 10:26:44
PDT. --
Jul 23 03:23:01 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
085014 ffffffff (1a70820b)
Jul 23 10:23:12 dashesy.wavelet kernel: tpm_crb MSFT0101:00: can't request
region for resource [mem 0xfed40040-0xfed4103f]
Jul 23 10:23:13 dashesy.wavelet mcelog[865]: Family 6 Model 5e CPU: only
decoding architectural errors
Jul 23 10:23:15 dashesy.wavelet bluetoothd[869]: Failed to obtain handles f=
or
"Service Changed" characteristic
Jul 23 10:23:41 dashesy.wavelet spice-vdagent[1493]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 23 10:23:56 dashesy.wavelet spice-vdagent[1985]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 23 10:23:58 dashesy.wavelet pulseaudio[2107]: [pulseaudio] pid.c: Daemon
already running.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14692950681.D11dA.22317
Date: Sat, 23 Jul 2016 17:31:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system freeze &quot;fifo: gr engine fault on channel 6&qu=
ot; NVIDIA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96876#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system freeze &quot;fifo: gr engine fault on channel 6&qu=
ot; NVIDIA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96876">bug 96876<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dashesy&#64;gmail.com" title=3D"Ehsan Azar &lt;dashesy&#64;gmail.com&gt;"> =
<span class=3D"fn">Ehsan Azar</span></a>
</span></b>
        <pre>Ok I am now running:

$ uname -a
Linux dashesy.wavelet 4.6.4-301.fc24.x86_64 #1 SMP Tue Jul 12 11:50:00 UTC =
2016
x86_64 x86_64 x86_64 GNU/Linux


Is this latest enough?
I am waiting to see if lockup happens again, but I am afraid I still see the
same kind of precursor:

$ journalctl --no-pager -b -p err
-- Logs begin at Thu 2016-05-05 05:39:48 PDT, end at Sat 2016-07-23 10:26:44
PDT. --
Jul 23 03:23:01 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
085014 ffffffff (1a70820b)
Jul 23 10:23:12 dashesy.wavelet kernel: tpm_crb MSFT0101:00: can't request
region for resource [mem 0xfed40040-0xfed4103f]
Jul 23 10:23:13 dashesy.wavelet mcelog[865]: Family 6 Model 5e CPU: only
decoding architectural errors
Jul 23 10:23:15 dashesy.wavelet bluetoothd[869]: Failed to obtain handles f=
or
&quot;Service Changed&quot; characteristic
Jul 23 10:23:41 dashesy.wavelet spice-vdagent[1493]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 23 10:23:56 dashesy.wavelet spice-vdagent[1985]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 23 10:23:58 dashesy.wavelet pulseaudio[2107]: [pulseaudio] pid.c: Daemon
already running.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14692950681.D11dA.22317--

--===============1506947358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1506947358==--
