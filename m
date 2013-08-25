From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] [NV31] lockup when using AGP. agpmode=0 fixes
	it.
Date: Sun, 25 Aug 2013 04:41:31 +0000
Message-ID: <bug-20341-8800-CiInpFPlPS@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0264365318=="
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


--===============0264365318==
Content-Type: multipart/alternative; boundary="1377405691.fBe2e5cA1.30660"; charset="us-ascii"


--1377405691.fBe2e5cA1.30660
Date: Sun, 25 Aug 2013 04:41:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #18 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 84576
  --> https://bugs.freedesktop.org/attachment.cgi?id=84576&action=edit
firefox corruption

Setting vram_pushbuf=1 seems to help a little.  There are no more lockups, but
graphics get trashed when things start moving fast (x11perf) or big and
complicated (fullscreen web browsers).  Basically, any large volume data
transfers.

After the initial corruption occurs due to the mystery trigger, the system
never really goes back to normal.  There's broken graphics everywhere, even on
unrelated, small, sparsely-updated windows.

Things look roughly like I remember writing about in Comment #4, so this
parameter is probably doing the same job as 'CBLocation'.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377405691.fBe2e5cA1.30660
Date: Sun, 25 Aug 2013 04:41:31 +0000
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
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84576" name="attach_84576" title="firefox corruption">attachment 84576</a> <a href="attachment.cgi?id=84576&amp;action=edit" title="firefox corruption">[details]</a></span>
firefox corruption

Setting vram_pushbuf=1 seems to help a little.  There are no more lockups, but
graphics get trashed when things start moving fast (x11perf) or big and
complicated (fullscreen web browsers).  Basically, any large volume data
transfers.

After the initial corruption occurs due to the mystery trigger, the system
never really goes back to normal.  There's broken graphics everywhere, even on
unrelated, small, sparsely-updated windows.

Things look roughly like I remember writing about in <a href="show_bug.cgi?id=20341#c4">Comment #4</a>, so this
parameter is probably doing the same job as 'CBLocation'.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377405691.fBe2e5cA1.30660--

--===============0264365318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0264365318==--
