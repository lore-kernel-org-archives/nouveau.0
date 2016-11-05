From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Sat, 05 Nov 2016 22:30:27 +0000
Message-ID: <bug-75985-8800-0IwX9ylJ8M@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1625008000=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1625008000==
Content-Type: multipart/alternative; boundary="14783850273.a38c4a962.24430";
 charset="UTF-8"


--14783850273.a38c4a962.24430
Date: Sat, 5 Nov 2016 22:30:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #8 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Following these steps I always see an audio function (01:00.1):

1. Power off laptop
2. Insert miniDP cable (HDMI probably works as well, did not test)
3. Power on laptop
4. Check lspci -s1:

When booting the laptop without cable there is some other weird behavior:
1. Power on laptop
2. Run "lspci -s1: ; lspci -H1 -s:"
   (first command also resumes the dGPU as side-effect)
   Expected: 2x 01:00:0
3. Wait 5 seconds for the card to runtime suspend (important, verify that t=
his
is actually the case, e.g. by watching "dmesg -w").
4. Insert cable
5. Run the above two lspci commands again. Now I also see the audio function
(01:00.1).
6. Repeat step 3, remove audio cable, repeat step 5 (now the audio function=
 is
gone again!)

This was tested on a Clevo P651RA (GTX 965M). Weird!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14783850273.a38c4a962.24430
Date: Sat, 5 Nov 2016 22:30:27 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Following these steps I always see an audio function (01:00.1):

1. Power off laptop
2. Insert miniDP cable (HDMI probably works as well, did not test)
3. Power on laptop
4. Check lspci -s1:

When booting the laptop without cable there is some other weird behavior:
1. Power on laptop
2. Run &quot;lspci -s1: ; lspci -H1 -s:&quot;
   (first command also resumes the dGPU as side-effect)
   Expected: 2x 01:00:0
3. Wait 5 seconds for the card to runtime suspend (important, verify that t=
his
is actually the case, e.g. by watching &quot;dmesg -w&quot;).
4. Insert cable
5. Run the above two lspci commands again. Now I also see the audio function
(01:00.1).
6. Repeat step 3, remove audio cable, repeat step 5 (now the audio function=
 is
gone again!)

This was tested on a Clevo P651RA (GTX 965M). Weird!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14783850273.a38c4a962.24430--

--===============1625008000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1625008000==--
