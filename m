From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70452] [NV43] Graphical corruption after resume from
 suspend or hibernation
Date: Tue, 26 Nov 2013 14:03:17 +0000
Message-ID: <bug-70452-8800-zoFLOvSsgT@http.bugs.freedesktop.org/>
References: <bug-70452-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0290643146=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70452-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0290643146==
Content-Type: multipart/alternative; boundary="1385474597.d1dA4dD61.25197"; charset="us-ascii"


--1385474597.d1dA4dD61.25197
Date: Tue, 26 Nov 2013 14:03:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70452

--- Comment #6 from Moi Jaiunvelo <moijaiunvelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried to backport libdrm from debian/sid and it fixed the graphical
corruption. More precisely for users who would like to reproduce it, I
backported libdrm2, libdrm-intel1, libdrm-radeon1 and libdrm-nouveau2 from
debian/sid to have them in 2.4.49-1 version.

Start-Date: 2013-11-26  10:49:54
Commandline: apt-get dist-upgrade
Upgrade: libdrm2:i386 (2.4.46-4, 2.4.49-1)
End-Date: 2013-11-26  10:49:58

Start-Date: 2013-11-26  10:55:27
Commandline: apt-get dist-upgrade
Upgrade: libdrm-intel1:i386 (2.4.46-4, 2.4.49-1), libdrm-radeon1:i386
(2.4.46-4, 2.4.49-1), libdrm-nouveau2:i386 (2.4.46-4, 2.4.49-1)
End-Date: 2013-11-26  10:55:34

Thank you for the advice,
Moi

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385474597.d1dA4dD61.25197
Date: Tue, 26 Nov 2013 14:03:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70452#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70452">bug 70452</a>
              from <span class="vcard"><a class="email" href="mailto:moijaiunvelo&#64;gmail.com" title="Moi Jaiunvelo &lt;moijaiunvelo&#64;gmail.com&gt;"> <span class="fn">Moi Jaiunvelo</span></a>
</span></b>
        <pre>I tried to backport libdrm from debian/sid and it fixed the graphical
corruption. More precisely for users who would like to reproduce it, I
backported libdrm2, libdrm-intel1, libdrm-radeon1 and libdrm-nouveau2 from
debian/sid to have them in 2.4.49-1 version.

Start-Date: 2013-11-26  10:49:54
Commandline: apt-get dist-upgrade
Upgrade: libdrm2:i386 (2.4.46-4, 2.4.49-1)
End-Date: 2013-11-26  10:49:58

Start-Date: 2013-11-26  10:55:27
Commandline: apt-get dist-upgrade
Upgrade: libdrm-intel1:i386 (2.4.46-4, 2.4.49-1), libdrm-radeon1:i386
(2.4.46-4, 2.4.49-1), libdrm-nouveau2:i386 (2.4.46-4, 2.4.49-1)
End-Date: 2013-11-26  10:55:34

Thank you for the advice,
Moi</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385474597.d1dA4dD61.25197--

--===============0290643146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0290643146==--
