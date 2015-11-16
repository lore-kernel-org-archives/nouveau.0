From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] KDE plasma locks randomly due to crash of
	nouveau driver
Date: Mon, 16 Nov 2015 20:25:30 +0000
Message-ID: <bug-92971-8800-IDVc8372ZU@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1537983917=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1537983917==
Content-Type: multipart/alternative; boundary="1447705530.B7a515F2.27562"; charset="UTF-8"


--1447705530.B7a515F2.27562
Date: Mon, 16 Nov 2015 20:25:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92971

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|DRM/other                   |Drivers/DRI/nouveau
            Version|XOrg git                    |unspecified
           Assignee|dri-devel-PD4FTy7X32lNgt0PjOBp93gSJqDPrsil@public.gmane.org |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |.org                        |rg
            Product|DRI                         |Mesa
         QA Contact|                            |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447705530.B7a515F2.27562
Date: Mon, 16 Nov 2015 20:25:30 +0000
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
   title="NEW - KDE plasma locks randomly due to crash of nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92971">bug 92971</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>DRM/other
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Version</td>
           <td>XOrg git
           </td>
           <td>unspecified
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Product</td>
           <td>DRI
           </td>
           <td>Mesa
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447705530.B7a515F2.27562--

--===============1537983917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1537983917==--
