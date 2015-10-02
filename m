From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91319] Nouveau driver cannot extract FCODE ROM / DCB
 Block from OpenFirmware Device tree
Date: Fri, 02 Oct 2015 07:44:12 +0000
Message-ID: <bug-91319-8800-5fS4HBNvs8@http.bugs.freedesktop.org/>
References: <bug-91319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1201089453=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1201089453==
Content-Type: multipart/alternative; boundary="1443771851.2C25e72F1.14602"; charset="UTF-8"


--1443771851.2C25e72F1.14602
Date: Fri, 2 Oct 2015 07:44:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91319

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You can try this patch, in Ben's tree which is ~4.3-rcN :

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=5b5cc342d3154120f9bb5ca7839ab556e728c786

This worked for me, but could use more testing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443771851.2C25e72F1.14602
Date: Fri, 2 Oct 2015 07:44:11 +0000
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
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">bug 91319</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You can try this patch, in Ben's tree which is ~4.3-rcN :

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=5b5cc342d3154120f9bb5ca7839ab556e728c786">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=5b5cc342d3154120f9bb5ca7839ab556e728c786</a>

This worked for me, but could use more testing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443771851.2C25e72F1.14602--

--===============1201089453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1201089453==--
