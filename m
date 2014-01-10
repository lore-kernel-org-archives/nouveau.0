From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Fri, 10 Jan 2014 20:39:35 +0000
Message-ID: <bug-71659-8800-hNVgcgJ7e2@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0283676251=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0283676251==
Content-Type: multipart/alternative; boundary="1389386375.bA1EA741.16623"; charset="us-ascii"


--1389386375.bA1EA741.16623
Date: Fri, 10 Jan 2014 20:39:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #12 from Rebecca Palmer <R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org> ---
Created attachment 91842
  --> https://bugs.freedesktop.org/attachment.cgi?id=91842&action=edit
kernel log 3.13rc7 and 3.11+firmware

The 3.13-rc7 upstream kernel in Ubuntu 13.10 also sometimes crashes, but not as
often as the near-identical kernel in Trusty; this might mean the regression is
in userspace, or might be the same persistence (presumably a left-behind
configuration change from 3.12) we saw earlier.

The blob firmware (in the standard 3.11 kernel) turns the login screen blank,
with no recognisable error in the log.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389386375.bA1EA741.16623
Date: Fri, 10 Jan 2014 20:39:35 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="Rebecca Palmer &lt;R.Palmer&#64;bham.ac.uk&gt;"> <span class="fn">Rebecca Palmer</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91842" name="attach_91842" title="kernel log 3.13rc7 and 3.11+firmware">attachment 91842</a> <a href="attachment.cgi?id=91842&amp;action=edit" title="kernel log 3.13rc7 and 3.11+firmware">[details]</a></span>
kernel log 3.13rc7 and 3.11+firmware

The 3.13-rc7 upstream kernel in Ubuntu 13.10 also sometimes crashes, but not as
often as the near-identical kernel in Trusty; this might mean the regression is
in userspace, or might be the same persistence (presumably a left-behind
configuration change from 3.12) we saw earlier.

The blob firmware (in the standard 3.11 kernel) turns the login screen blank,
with no recognisable error in the log.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389386375.bA1EA741.16623--

--===============0283676251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0283676251==--
