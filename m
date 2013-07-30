From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Tue, 30 Jul 2013 00:20:55 +0000
Message-ID: <bug-67315-8800-ZJ9atA4VIw@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1394332322=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1394332322==
Content-Type: multipart/alternative; boundary="1375143655.b57B1.11278"; charset="us-ascii"


--1375143655.b57B1.11278
Date: Tue, 30 Jul 2013 00:20:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #15 from Rick Stevens <ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org> ---
Sorry, forgot to comment about the attachment I just put up.

The machine did use plymouth, so I removed the "rhgb" stuff from the boot
command and repeated everything as before, but included both Xorg.0.log[.old]
files and another capture of dmesg.

The screensaver is "xscreensaver" and the menu tree fires up
"xscreensaver-demo".
They come from the xscreensaver-5.22.1.fc19.x86_64 set of RPMs. The system is
up-to-date running kernel 3.10.3-300.fc19.x86_64.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375143655.b57B1.11278
Date: Tue, 30 Jul 2013 00:20:55 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:ricks&#64;alldigital.com" title="Rick Stevens &lt;ricks&#64;alldigital.com&gt;"> <span class="fn">Rick Stevens</span></a>
</span></b>
        <pre>Sorry, forgot to comment about the attachment I just put up.

The machine did use plymouth, so I removed the &quot;rhgb&quot; stuff from the boot
command and repeated everything as before, but included both Xorg.0.log[.old]
files and another capture of dmesg.

The screensaver is &quot;xscreensaver&quot; and the menu tree fires up
&quot;xscreensaver-demo&quot;.
They come from the xscreensaver-5.22.1.fc19.x86_64 set of RPMs. The system is
up-to-date running kernel 3.10.3-300.fc19.x86_64.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375143655.b57B1.11278--

--===============1394332322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1394332322==--
