From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69982] [NV86] GPU+system crash with nouveau and
	kernel 3.12-rc3
Date: Tue, 08 Oct 2013 09:19:18 +0000
Message-ID: <bug-69982-8800-pauzuU96QR@http.bugs.freedesktop.org/>
References: <bug-69982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0629254112=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69982-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0629254112==
Content-Type: multipart/alternative; boundary="1381223958.65Ee1.7363"; charset="us-ascii"


--1381223958.65Ee1.7363
Date: Tue, 8 Oct 2013 09:19:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69982

--- Comment #12 from Mike C <mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have now tested kernel 3.12 rc4 with my arch linux system which had updates
to nouveau-dri to version 9.2.1-1, and to mesa-libgl version 9.2.1-1

The original problem of the system freezing within a minute or so of logging in
to KDE has come back, despite using NvMSI=0 so the issue remains, but I don't
know if this is due to the mesa/nouveau updates or to changes in the rc4
kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381223958.65Ee1.7363
Date: Tue, 8 Oct 2013 09:19:18 +0000
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
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982">bug 69982</a>
              from <span class="vcard"><a class="email" href="mailto:mike.cloaked&#64;gmail.com" title="Mike C &lt;mike.cloaked&#64;gmail.com&gt;"> <span class="fn">Mike C</span></a>
</span></b>
        <pre>I have now tested kernel 3.12 rc4 with my arch linux system which had updates
to nouveau-dri to version 9.2.1-1, and to mesa-libgl version 9.2.1-1

The original problem of the system freezing within a minute or so of logging in
to KDE has come back, despite using NvMSI=0 so the issue remains, but I don't
know if this is due to the mesa/nouveau updates or to changes in the rc4
kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381223958.65Ee1.7363--

--===============0629254112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0629254112==--
