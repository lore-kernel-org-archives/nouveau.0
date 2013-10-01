From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69982] [NV86] GPU+system crash with nouveau and
	kernel 3.12-rc3
Date: Tue, 01 Oct 2013 13:33:14 +0000
Message-ID: <bug-69982-8800-1P4GPL7pN1@http.bugs.freedesktop.org/>
References: <bug-69982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0855677127=="
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


--===============0855677127==
Content-Type: multipart/alternative; boundary="1380634394.075E1.13234"; charset="us-ascii"


--1380634394.075E1.13234
Date: Tue, 1 Oct 2013 13:33:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69982

--- Comment #11 from Mike C <mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As a temporary workaround I made a file /etc/modprobe.d/nouveau.conf containing
one line:

option nouveau config:NvMSI=0

Now booting the 3.12 rc3 kernel with this in place gives a working system until
the nouveau driver has a fix.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380634394.075E1.13234
Date: Tue, 1 Oct 2013 13:33:14 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982">bug 69982</a>
              from <span class="vcard"><a class="email" href="mailto:mike.cloaked&#64;gmail.com" title="Mike C &lt;mike.cloaked&#64;gmail.com&gt;"> <span class="fn">Mike C</span></a>
</span></b>
        <pre>As a temporary workaround I made a file /etc/modprobe.d/nouveau.conf containing
one line:

option nouveau config:NvMSI=0

Now booting the 3.12 rc3 kernel with this in place gives a working system until
the nouveau driver has a fix.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380634394.075E1.13234--

--===============0855677127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0855677127==--
