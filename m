From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Thu, 09 Jan 2014 21:25:51 +0000
Message-ID: <bug-71659-8800-flZDK7FvTM@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2043280985=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2043280985==
Content-Type: multipart/alternative; boundary="1389302751.Addfef1.26786"; charset="us-ascii"


--1389302751.Addfef1.26786
Date: Thu, 9 Jan 2014 21:25:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #10 from Rebecca Palmer <R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org> ---
Created attachment 91782
  --> https://bugs.freedesktop.org/attachment.cgi?id=91782&action=edit
Ubuntu 14.04 (Linux 3.13.0) log

This bug is easier to trigger in Ubuntu Trusty (kernel 3.13.0, libdrm-nouveau2
2.4.50, xserver-xorg-video-nouveau 1.0.10, mesa 10.0.1), occurring immediately
on heavy graphics load and within a few minutes even in ordinary use.

The attached log contains more instances of the warning than were normal in
13.10, but not the final error (I suspect it wasn't synced to disk).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389302751.Addfef1.26786
Date: Thu, 9 Jan 2014 21:25:51 +0000
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
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="Rebecca Palmer &lt;R.Palmer&#64;bham.ac.uk&gt;"> <span class="fn">Rebecca Palmer</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91782" name="attach_91782" title="Ubuntu 14.04 (Linux 3.13.0) log">attachment 91782</a> <a href="attachment.cgi?id=91782&amp;action=edit" title="Ubuntu 14.04 (Linux 3.13.0) log">[details]</a></span>
Ubuntu 14.04 (Linux 3.13.0) log

This bug is easier to trigger in Ubuntu Trusty (kernel 3.13.0, libdrm-nouveau2
2.4.50, xserver-xorg-video-nouveau 1.0.10, mesa 10.0.1), occurring immediately
on heavy graphics load and within a few minutes even in ordinary use.

The attached log contains more instances of the warning than were normal in
13.10, but not the final error (I suspect it wasn't synced to disk).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389302751.Addfef1.26786--

--===============2043280985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2043280985==--
