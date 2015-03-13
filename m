From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89571] [NV46] XFX 7300 GS - Black screen with DVI
 when KMS(nouveau) starts - VGA working
Date: Fri, 13 Mar 2015 15:44:31 +0000
Message-ID: <bug-89571-8800-zZAXgN1vc7@http.bugs.freedesktop.org/>
References: <bug-89571-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1931325298=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89571-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1931325298==
Content-Type: multipart/alternative; boundary="1426261471.eC1FbC1.25027"; charset="UTF-8"


--1426261471.eC1FbC1.25027
Date: Fri, 13 Mar 2015 15:44:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89571

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|XFX 7300 GS - Black screen  |[NV46] XFX 7300 GS - Black
                   |with DVI when KMS(nouveau)  |screen with DVI when
                   |starts - VGA working        |KMS(nouveau) starts - VGA
                   |                            |working

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please provide dmesg from a boot with

nouveau.debug=trace drm.debug=0xe

Both with VGA plugged in, and with DVI plugged in. Also, please attach files to
the bug, not pastebins (which expire). Include the full dmesg, not a grep for
'nouveau'. There are other things that are interesting in there.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426261471.eC1FbC1.25027
Date: Fri, 13 Mar 2015 15:44:31 +0000
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
   title="NEW - [NV46] XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89571">bug 89571</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working
           </td>
           <td>[NV46] XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89571#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89571">bug 89571</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please provide dmesg from a boot with

nouveau.debug=trace drm.debug=0xe

Both with VGA plugged in, and with DVI plugged in. Also, please attach files to
the bug, not pastebins (which expire). Include the full dmesg, not a grep for
'nouveau'. There are other things that are interesting in there.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426261471.eC1FbC1.25027--

--===============1931325298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1931325298==--
