From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Wed, 26 Mar 2014 23:06:01 +0000
Message-ID: <bug-76475-8800-veZDkdWp6O@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1130095957=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76475-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1130095957==
Content-Type: multipart/alternative; boundary="1395875161.0D720AD82.30207"; charset="us-ascii"


--1395875161.0D720AD82.30207
Date: Wed, 26 Mar 2014 23:06:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
My (limited) understanding is that _DSM is used to turn the card on/off and
switch the mux on relevant laptops between the different GPU's. And the ACPI
vbios method was introduced for optimus laptops -- those checks have always
been there. I'm fairly sure they can be dropped.

Just to confirm -- dropping the checks from
nouveau_acpi.c:nouveau_acpi_rom_supported (and no other changes) makes the
VBIOS get loaded from ACPI, without errors.

For the kworker thing -- see what's going on -- 'echo w > /proc/sysrq-trigger'
(iirc; perhaps a different sysrq would be helpful... see if it's in nouveau or
not. even if it is, it may not be related to this specific issue.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395875161.0D720AD82.30207
Date: Wed, 26 Mar 2014 23:06:01 +0000
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
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>My (limited) understanding is that _DSM is used to turn the card on/off and
switch the mux on relevant laptops between the different GPU's. And the ACPI
vbios method was introduced for optimus laptops -- those checks have always
been there. I'm fairly sure they can be dropped.

Just to confirm -- dropping the checks from
nouveau_acpi.c:nouveau_acpi_rom_supported (and no other changes) makes the
VBIOS get loaded from ACPI, without errors.

For the kworker thing -- see what's going on -- 'echo w &gt; /proc/sysrq-trigger'
(iirc; perhaps a different sysrq would be helpful... see if it's in nouveau or
not. even if it is, it may not be related to this specific issue.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395875161.0D720AD82.30207--

--===============1130095957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1130095957==--
