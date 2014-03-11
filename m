From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72315] Fedora 19 64-bit X crash
Date: Tue, 11 Mar 2014 14:12:35 +0000
Message-ID: <bug-72315-8800-7etOgytnhT@http.bugs.freedesktop.org/>
References: <bug-72315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0414325797=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0414325797==
Content-Type: multipart/alternative; boundary="1394547155.8Abc12CE1.20701"; charset="us-ascii"


--1394547155.8Abc12CE1.20701
Date: Tue, 11 Mar 2014 14:12:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72315

--- Comment #3 from Darin McBride <Tanktalus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This looks like the same problem I'm getting with Gentoo, linux-3.13.6, NVIDIA
Corporation GK106 [GeForce GTX 650 Ti].

Except that I've gotten it twice, and both times the display was completely
unusable.  I had a blinking cursor at the top left of both of my monitors, and
the KDE-based mouse pointer was still there on one monitor, but wasn't moving. 
I could ssh in, but could not restart xdm, thus rebooted.  I'm now using the
nvidia binary blob driver, which has different problems, but I'm hoping that a
kernel crash isn't one of them.

Note that I got 304 of these TRAPs in my syslog over the course of about an
hour or so.

nouveau is (was) compiled into my kernel - I don't use many kernel features as
modules.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394547155.8Abc12CE1.20701
Date: Tue, 11 Mar 2014 14:12:35 +0000
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
   title="NEW --- - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315">bug 72315</a>
              from <span class="vcard"><a class="email" href="mailto:Tanktalus&#64;gmail.com" title="Darin McBride &lt;Tanktalus&#64;gmail.com&gt;"> <span class="fn">Darin McBride</span></a>
</span></b>
        <pre>This looks like the same problem I'm getting with Gentoo, linux-3.13.6, NVIDIA
Corporation GK106 [GeForce GTX 650 Ti].

Except that I've gotten it twice, and both times the display was completely
unusable.  I had a blinking cursor at the top left of both of my monitors, and
the KDE-based mouse pointer was still there on one monitor, but wasn't moving. 
I could ssh in, but could not restart xdm, thus rebooted.  I'm now using the
nvidia binary blob driver, which has different problems, but I'm hoping that a
kernel crash isn't one of them.

Note that I got 304 of these TRAPs in my syslog over the course of about an
hour or so.

nouveau is (was) compiled into my kernel - I don't use many kernel features as
modules.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394547155.8Abc12CE1.20701--

--===============0414325797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0414325797==--
