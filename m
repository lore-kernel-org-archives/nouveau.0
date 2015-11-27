From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47556] [NV17] nouveau fails to handle/set
 resolutions over certain size, nouveau_bo_new() -ENOMEM
Date: Fri, 27 Nov 2015 11:15:38 +0000
Message-ID: <bug-47556-8800-ds7pZtJn84@http.bugs.freedesktop.org/>
References: <bug-47556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1878180330=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1878180330==
Content-Type: multipart/alternative; boundary="1448622937.AB22f1.18434"; charset="UTF-8"


--1448622937.AB22f1.18434
Date: Fri, 27 Nov 2015 11:15:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47556

--- Comment #22 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
This is likely still an issue with some older machines though testing it got
stuck because of a kernel s2ram bug:
http://mirror1.htu.tugraz.at/archlinux/iso/2015.11.01/archlinux-2015.11.01-dual.iso.
The notebook used to test this is still alive.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448622937.AB22f1.18434
Date: Fri, 27 Nov 2015 11:15:37 +0000
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
   title="NEW - [NV17] nouveau fails to handle/set resolutions over certain size, nouveau_bo_new() -ENOMEM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV17] nouveau fails to handle/set resolutions over certain size, nouveau_bo_new() -ENOMEM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556">bug 47556</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>This is likely still an issue with some older machines though testing it got
stuck because of a kernel s2ram bug:
<a href="http://mirror1.htu.tugraz.at/archlinux/iso/2015.11.01/archlinux-2015.11.01-dual.iso">http://mirror1.htu.tugraz.at/archlinux/iso/2015.11.01/archlinux-2015.11.01-dual.iso</a>.
The notebook used to test this is still alive.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448622937.AB22f1.18434--

--===============1878180330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1878180330==--
