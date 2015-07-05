From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86537] [NV96] Unable to handle page request from
 nv50_crtc_(prepare, disable) on dual Nvidia setup
Date: Sun, 05 Jul 2015 22:37:02 +0000
Message-ID: <bug-86537-8800-cx1k3oeSIf@http.bugs.freedesktop.org/>
References: <bug-86537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1994204631=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1994204631==
Content-Type: multipart/alternative; boundary="1436135822.Ed2a1.11279"; charset="UTF-8"


--1436135822.Ed2a1.11279
Date: Sun, 5 Jul 2015 22:37:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86537

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|DUPLICATE                   |---
            Summary|[NV96] Unable to handle     |[NV96] Unable to handle
                   |page request from           |page request from
                   |nv50_crtc_prepare           |nv50_crtc_(prepare,disable)
                   |                            |on dual Nvidia setup

--- Comment #8 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Reopening this bug as its core issue is different from the other bug's one.

Setting the 8 LSB of register 0x8841c (PPCI.CONFIG) to 0 makes it possible to
interact with the card normally, without any crashes. Though after powering off
the G96, switching to it from the MCP79 will result in a blank screen: no error
message outputed, no hang, just a blank screen. I'll push a hacky patch for
those who wants to use their G96, or power it down; you may alternatively run
`nvapoke -c0 0x8841c 28400` **before** loading Nouveau.

This bit resetting is also done by the PCI reset step.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436135822.Ed2a1.11279
Date: Sun, 5 Jul 2015 22:37:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NV96] Unable to handle page request from nv50_crtc_(prepare,disable) on dual Nvidia setup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537">bug 86537</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>DUPLICATE
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NV96] Unable to handle page request from nv50_crtc_prepare
           </td>
           <td>[NV96] Unable to handle page request from nv50_crtc_(prepare,disable) on dual Nvidia setup
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NV96] Unable to handle page request from nv50_crtc_(prepare,disable) on dual Nvidia setup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NV96] Unable to handle page request from nv50_crtc_(prepare,disable) on dual Nvidia setup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537">bug 86537</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Reopening this bug as its core issue is different from the other bug's one.

Setting the 8 LSB of register 0x8841c (PPCI.CONFIG) to 0 makes it possible to
interact with the card normally, without any crashes. Though after powering off
the G96, switching to it from the MCP79 will result in a blank screen: no error
message outputed, no hang, just a blank screen. I'll push a hacky patch for
those who wants to use their G96, or power it down; you may alternatively run
`nvapoke -c0 0x8841c 28400` **before** loading Nouveau.

This bit resetting is also done by the PCI reset step.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436135822.Ed2a1.11279--

--===============1994204631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1994204631==--
