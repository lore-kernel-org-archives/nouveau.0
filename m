From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91125] [NVE7] Nouveau read fault, locking up the gpu
Date: Mon, 17 Aug 2015 23:11:34 +0000
Message-ID: <bug-91125-8800-ftzJyVvCsK@http.bugs.freedesktop.org/>
References: <bug-91125-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1919155386=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91125-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1919155386==
Content-Type: multipart/alternative; boundary="1439853093.0Aac72.16353"; charset="UTF-8"


--1439853093.0Aac72.16353
Date: Mon, 17 Aug 2015 23:11:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91125

--- Comment #2 from Jonathan Ryshpan <jonrysh-yBeKhBN/0LDR7s880joybQ@public.gmane.org> ---
I hit this bug frequently, usually after some minor user action like closing a
window.  When it happens the screen freezes except for the cursor; when I look
at a console via ctrl/f2 and wait for a while (about 2 minutes) I see messages
like:
[20235.667444] nouveau E[plasmashell][16831] fail set_domain
[20235.667782] nouveau E[plasmashell][16831] validating bo list
[20235.668235] nouveau E[plasmachell][16831] valicate: -22

As soon as these messages appear, the desktop becomes mostly usable, but often
strange; the icons become weird and some system messages are corrupted.  In a
following comment (after I get the desktop back), I will attach a snapshot of
the weird desktop and today's journal file.

The system is difficult to use with this bug.

System is
  Amd-64 4-processor hardware
  Nvidia 9500GT Graphics Card
  Fedora-22 with all updates
  KDE Frameworks 5.12.0

Xorg -version
X.Org X Server 1.17.2
Release Date: 2015-06-16
X Protocol Version 11, Revision 0
Build Operating System:  4.0.4-202.fc21.x86_64 
Current Operating System: Linux amito 4.1.4-200.fc22.x86_64 #1 SMP Tue Aug 4
03:22:33 UTC 2015 x86_64
Kernel command line: BOOT_IMAGE=/vmlinuz-4.1.4-200.fc22.x86_64
root=/dev/mapper/fedora00-root ro rd.lvm.lv=fedora00/swap
rd.lvm.lv=fedora00/root rhgb quiet LANG=en_US.UTF-8
Build Date: 15 July 2015  08:16:41AM
Build ID: xorg-x11-server 1.17.2-2.fc22 
Current version of pixman: 0.32.6

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439853093.0Aac72.16353
Date: Mon, 17 Aug 2015 23:11:33 +0000
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
   title="NEW - [NVE7] Nouveau read fault, locking up the gpu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91125#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Nouveau read fault, locking up the gpu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91125">bug 91125</a>
              from <span class="vcard"><a class="email" href="mailto:jonrysh&#64;pacbell.net" title="Jonathan Ryshpan &lt;jonrysh&#64;pacbell.net&gt;"> <span class="fn">Jonathan Ryshpan</span></a>
</span></b>
        <pre>I hit this bug frequently, usually after some minor user action like closing a
window.  When it happens the screen freezes except for the cursor; when I look
at a console via ctrl/f2 and wait for a while (about 2 minutes) I see messages
like:
[20235.667444] nouveau E[plasmashell][16831] fail set_domain
[20235.667782] nouveau E[plasmashell][16831] validating bo list
[20235.668235] nouveau E[plasmachell][16831] valicate: -22

As soon as these messages appear, the desktop becomes mostly usable, but often
strange; the icons become weird and some system messages are corrupted.  In a
following comment (after I get the desktop back), I will attach a snapshot of
the weird desktop and today's journal file.

The system is difficult to use with this bug.

System is
  Amd-64 4-processor hardware
  Nvidia 9500GT Graphics Card
  Fedora-22 with all updates
  KDE Frameworks 5.12.0

Xorg -version
X.Org X Server 1.17.2
Release Date: 2015-06-16
X Protocol Version 11, Revision 0
Build Operating System:  4.0.4-202.fc21.x86_64 
Current Operating System: Linux amito 4.1.4-200.fc22.x86_64 #1 SMP Tue Aug 4
03:22:33 UTC 2015 x86_64
Kernel command line: BOOT_IMAGE=/vmlinuz-4.1.4-200.fc22.x86_64
root=/dev/mapper/fedora00-root ro rd.lvm.lv=fedora00/swap
rd.lvm.lv=fedora00/root rhgb quiet LANG=en_US.UTF-8
Build Date: 15 July 2015  08:16:41AM
Build ID: xorg-x11-server 1.17.2-2.fc22 
Current version of pixman: 0.32.6</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439853093.0Aac72.16353--

--===============1919155386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1919155386==--
