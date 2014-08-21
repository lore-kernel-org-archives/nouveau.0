From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] [NVE7] Lenovo Y500 with 2x GT650M,
 first card gets wrong vbios, fails boot on 3.13+
Date: Thu, 21 Aug 2014 22:33:08 +0000
Message-ID: <bug-75511-8800-Kuguuq6OPr@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1417274498=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1417274498==
Content-Type: multipart/alternative; boundary="1408660387.D0DbB2.32198"; charset="us-ascii"


--1408660387.D0DbB2.32198
Date: Thu, 21 Aug 2014 22:33:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #10)
> Would you mind trying to edit nouveau_acpi.c:nouveau_acpi_rom_supported and
> removing the check for dsm_detected and optimus_detected? (And then booting
> that without the NvBios setting.) I think the situation is that those aren't
> set, but we should still get the rom from ACPI for that first card.

A patch to do this was merged a while back, and backported to stable kernels.
Pretty sure it will fix the issue for you (without needing the NvBios thing).
Feel free to re-open if not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408660387.D0DbB2.32198
Date: Thu, 21 Aug 2014 22:33:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] Lenovo Y500 with 2x GT650M, first card gets wrong vbios, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] Lenovo Y500 with 2x GT650M, first card gets wrong vbios, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] Lenovo Y500 with 2x GT650M, first card gets wrong vbios, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75511#c10">comment #10</a>)
<span class="quote">&gt; Would you mind trying to edit nouveau_acpi.c:nouveau_acpi_rom_supported and
&gt; removing the check for dsm_detected and optimus_detected? (And then booting
&gt; that without the NvBios setting.) I think the situation is that those aren't
&gt; set, but we should still get the rom from ACPI for that first card.</span >

A patch to do this was merged a while back, and backported to stable kernels.
Pretty sure it will fix the issue for you (without needing the NvBios thing).
Feel free to re-open if not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408660387.D0DbB2.32198--

--===============1417274498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1417274498==--
