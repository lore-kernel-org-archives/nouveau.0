From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85100] [NV108] Geforce GT730: X freezes during
 normal 2d operation.
Date: Thu, 16 Oct 2014 16:52:26 +0000
Message-ID: <bug-85100-8800-v0KujmV1sM@http.bugs.freedesktop.org/>
References: <bug-85100-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0215985307=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85100-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0215985307==
Content-Type: multipart/alternative; boundary="1413478346.ec2b32.30419"; charset="UTF-8"


--1413478346.ec2b32.30419
Date: Thu, 16 Oct 2014 16:52:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85100

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The 0x260 stuff isn't an issue... that register is just gone on the GK208 but
we're still writing to it. I think that 3.17 fixes that... if not, 3.18.

The engine faults aren't so great, however. The ones you pasted are from
PGRAPH, but the earlier stuff was in attaching the software object to the fifo.
The software object is used for vsync/page flipping handling, so failures with
it can account for perceived hangs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413478346.ec2b32.30419
Date: Thu, 16 Oct 2014 16:52:26 +0000
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
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100">bug 85100</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The 0x260 stuff isn't an issue... that register is just gone on the GK208 but
we're still writing to it. I think that 3.17 fixes that... if not, 3.18.

The engine faults aren't so great, however. The ones you pasted are from
PGRAPH, but the earlier stuff was in attaching the software object to the fifo.
The software object is used for vsync/page flipping handling, so failures with
it can account for perceived hangs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413478346.ec2b32.30419--

--===============0215985307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0215985307==--
