From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] NV31 lockup
Date: Sun, 25 Aug 2013 03:56:55 +0000
Message-ID: <bug-20341-8800-OcykYYl303@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1288955653=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1288955653==
Content-Type: multipart/alternative; boundary="1377403016.c5447d1.23264"; charset="us-ascii"


--1377403016.c5447d1.23264
Date: Sun, 25 Aug 2013 03:56:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #16 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 84575
  --> https://bugs.freedesktop.org/attachment.cgi?id=84575&action=edit
Valgrind mmap trace log

Attaching valgrind mmap trace log.

Notes:
- Prior to testing the kernel was upgraded to nouveau/linux-2.6 master @
3b56bba6abaa70d629fccdcf8490e087ea3a1ab4 "drm/nv04/disp: fix framebuffer pin
refcounting" 2013-08-21 01:37:09 (GMT)

- The agpmode=0 noveau.ko parameter was removed.

- X was especially slow during the test, as expected.  This corresponds to the
note on valgrind-mmt's wiki page: "tracing slows down Xorg considerably - ~20x"

- X did not crash during this test.  The test procedure was conducted 5 times
to ensure the system didn't have a spurious nonfailure.

- This is a huge logfile.  It will expand to ~220 MB when decompressed.  This
log covers only the first test instance.

- Rerunning the test without valgrind caused the usual lockup.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377403016.c5447d1.23264
Date: Sun, 25 Aug 2013 03:56:56 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84575" name="attach_84575" title="Valgrind mmap trace log">attachment 84575</a> <a href="attachment.cgi?id=84575&amp;action=edit" title="Valgrind mmap trace log">[details]</a></span>
Valgrind mmap trace log

Attaching valgrind mmap trace log.

Notes:
- Prior to testing the kernel was upgraded to nouveau/linux-2.6 master &#64;
3b56bba6abaa70d629fccdcf8490e087ea3a1ab4 &quot;drm/nv04/disp: fix framebuffer pin
refcounting&quot; 2013-08-21 01:37:09 (GMT)

- The agpmode=0 noveau.ko parameter was removed.

- X was especially slow during the test, as expected.  This corresponds to the
note on valgrind-mmt's wiki page: &quot;tracing slows down Xorg considerably - ~20x&quot;

- X did not crash during this test.  The test procedure was conducted 5 times
to ensure the system didn't have a spurious nonfailure.

- This is a huge logfile.  It will expand to ~220 MB when decompressed.  This
log covers only the first test instance.

- Rerunning the test without valgrind caused the usual lockup.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377403016.c5447d1.23264--

--===============1288955653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1288955653==--
