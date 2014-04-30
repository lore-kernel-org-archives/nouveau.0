From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Wed, 30 Apr 2014 07:33:24 +0000
Message-ID: <bug-78092-8800-21kW7WVKEZ@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0421848589=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0421848589==
Content-Type: multipart/alternative; boundary="1398843203.fe7f1.12391"; charset="us-ascii"


--1398843203.fe7f1.12391
Date: Wed, 30 Apr 2014 07:33:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Very odd. I looked at the _DSM method, and it _seems_ like it's there and
should work. The method is there, I traced through it, and based on my meager
understanding of ACPI it should be returning an appropriate buffer (via the
'NVOP' function). But clearly something's going wrong, since the prints in
nouveau_acpi.c are never even hit, which means it thinks it's _really_ not
optimus.

The only weird thing about the ACPI dump is that there are two Device (VID)
sections, but I don't know ACPI intimately enough to tell whether that's in any
way bad. You _do_ have 2 gfx cards. Presumably ACPI specifies some way of
mapping these things, but I just don't know what that is. But I bet that the
people who wrote ACPI support in Linux do :)

If you're comfortable making small edits to code, mind dropping a boatload of
printk's all over nouveau_dsm_pci_probe, nouveau_test_dsm, and
nouveau_optimus_dsm to try to see why that logic is deciding you're not in an
optimus setup? Otherwise I can probably put together a patch for you to test
out...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398843203.fe7f1.12391
Date: Wed, 30 Apr 2014 07:33:23 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Very odd. I looked at the _DSM method, and it _seems_ like it's there and
should work. The method is there, I traced through it, and based on my meager
understanding of ACPI it should be returning an appropriate buffer (via the
'NVOP' function). But clearly something's going wrong, since the prints in
nouveau_acpi.c are never even hit, which means it thinks it's _really_ not
optimus.

The only weird thing about the ACPI dump is that there are two Device (VID)
sections, but I don't know ACPI intimately enough to tell whether that's in any
way bad. You _do_ have 2 gfx cards. Presumably ACPI specifies some way of
mapping these things, but I just don't know what that is. But I bet that the
people who wrote ACPI support in Linux do :)

If you're comfortable making small edits to code, mind dropping a boatload of
printk's all over nouveau_dsm_pci_probe, nouveau_test_dsm, and
nouveau_optimus_dsm to try to see why that logic is deciding you're not in an
optimus setup? Otherwise I can probably put together a patch for you to test
out...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398843203.fe7f1.12391--

--===============0421848589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0421848589==--
