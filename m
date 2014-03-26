From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] [NVE7] Lenovo Y500 with 2x GT650M,
 first card gets wrong vbios, fails boot on 3.13+
Date: Wed, 26 Mar 2014 21:26:35 +0000
Message-ID: <bug-75511-8800-kskrmBTt01@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1947195491=="
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


--===============1947195491==
Content-Type: multipart/alternative; boundary="1395869195.Ac222.4103"; charset="us-ascii"


--1395869195.Ac222.4103
Date: Wed, 26 Mar 2014 21:26:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Would you mind trying to edit nouveau_acpi.c:nouveau_acpi_rom_supported and
removing the check for dsm_detected and optimus_detected? (And then booting
that without the NvBios setting.) I think the situation is that those aren't
set, but we should still get the rom from ACPI for that first card.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395869195.Ac222.4103
Date: Wed, 26 Mar 2014 21:26:35 +0000
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
   title="NEW --- - [NVE7] Lenovo Y500 with 2x GT650M, first card gets wrong vbios, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Lenovo Y500 with 2x GT650M, first card gets wrong vbios, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Would you mind trying to edit nouveau_acpi.c:nouveau_acpi_rom_supported and
removing the check for dsm_detected and optimus_detected? (And then booting
that without the NvBios setting.) I think the situation is that those aren't
set, but we should still get the rom from ACPI for that first card.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395869195.Ac222.4103--

--===============1947195491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1947195491==--
