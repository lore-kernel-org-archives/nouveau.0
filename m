From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85100] [NV108] Geforce GT730: X freezes during
 normal 2d operation.
Date: Thu, 16 Oct 2014 16:26:51 +0000
Message-ID: <bug-85100-8800-Q5PwrLx2y9@http.bugs.freedesktop.org/>
References: <bug-85100-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0952887501=="
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


--===============0952887501==
Content-Type: multipart/alternative; boundary="1413476811.006cF2.21348"; charset="UTF-8"


--1413476811.006cF2.21348
Date: Thu, 16 Oct 2014 16:26:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85100

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Geforce GT730: X freezes    |[NV108] Geforce GT730: X
                   |during normal 2d operation. |freezes during normal 2d
                   |                            |operation.

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[   70.860202] nouveau E[   PFIFO][0000:02:00.0] PBDMA0: LBREQ
[   70.860218] nouveau E[   PFIFO][0000:02:00.0] PBDMA0: ch 2 [Xorg.bin[390]]
subc 5 mthd 0x0000 data 0x0000906e

I guess it's having trouble attaching the software object? Weird...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413476811.006cF2.21348
Date: Thu, 16 Oct 2014 16:26:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100">bug 85100</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Geforce GT730: X freezes during normal 2d operation.
           </td>
           <td>[NV108] Geforce GT730: X freezes during normal 2d operation.
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100">bug 85100</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[   70.860202] nouveau E[   PFIFO][0000:02:00.0] PBDMA0: LBREQ
[   70.860218] nouveau E[   PFIFO][0000:02:00.0] PBDMA0: ch 2 [Xorg.bin[390]]
subc 5 mthd 0x0000 data 0x0000906e

I guess it's having trouble attaching the software object? Weird...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413476811.006cF2.21348--

--===============0952887501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0952887501==--
