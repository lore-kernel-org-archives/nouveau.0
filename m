From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Tue, 08 Oct 2013 07:16:54 +0000
Message-ID: <bug-70208-8800-p303VWfMfj@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1773526440=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1773526440==
Content-Type: multipart/alternative; boundary="1381216614.c7DF21.13541"; charset="us-ascii"


--1381216614.c7DF21.13541
Date: Tue, 8 Oct 2013 07:16:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #19 from Fred New <fred.new2911-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
FWIW, I had problem building the kernel with the second version of the patch
(87214) for Fedora 20 beta TC1 using rpmbuild, but then I'm a lightweight when
it comes to actual programming:

drivers/gpu/drm/nouveau/nouveau_acpi.c: In function
'nouveau_pci_get_class_masked':
drivers/gpu/drm/nouveau/nouveau_acpi.c:276:2: error: implicit declaration of
function 'pci_get_dev_by_id' [-Werror=implicit-function-declaration]
  return pci_get_dev_by_id(&id, from);
  ^
drivers/gpu/drm/nouveau/nouveau_acpi.c:276:2: warning: return makes pointer
from integer without a cast [enabled by default]
cc1: some warnings being treated as errors
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_acpi.o] Error 1
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381216614.c7DF21.13541
Date: Tue, 8 Oct 2013 07:16:54 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:fred.new2911&#64;gmail.com" title="Fred New &lt;fred.new2911&#64;gmail.com&gt;"> <span class="fn">Fred New</span></a>
</span></b>
        <pre>FWIW, I had problem building the kernel with the second version of the patch
(87214) for Fedora 20 beta TC1 using rpmbuild, but then I'm a lightweight when
it comes to actual programming:

drivers/gpu/drm/nouveau/nouveau_acpi.c: In function
'nouveau_pci_get_class_masked':
drivers/gpu/drm/nouveau/nouveau_acpi.c:276:2: error: implicit declaration of
function 'pci_get_dev_by_id' [-Werror=implicit-function-declaration]
  return pci_get_dev_by_id(&amp;id, from);
  ^
drivers/gpu/drm/nouveau/nouveau_acpi.c:276:2: warning: return makes pointer
from integer without a cast [enabled by default]
cc1: some warnings being treated as errors
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_acpi.o] Error 1
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381216614.c7DF21.13541--

--===============1773526440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1773526440==--
