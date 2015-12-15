From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Tue, 15 Dec 2015 16:23:23 +0000
Message-ID: <bug-59069-8800-9KMeS06nj8@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0215045065=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0215045065==
Content-Type: multipart/alternative; boundary="1450196603.5aBee3.24464"; charset="UTF-8"


--1450196603.5aBee3.24464
Date: Tue, 15 Dec 2015 16:23:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

peter swain <swine-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |swine-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org

--- Comment #32 from peter swain <swine-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> ---
Created attachment 120530
  --> https://bugs.freedesktop.org/attachment.cgi?id=120530&action=edit
kern.log from 4.2.0-19-generic ubuntu-15.10 with dual-head NV44

Working nicely until woken from overnight screen blanking, then the classic
ttm_validate issue.
This is with ppa.launchpad.net/graphics-drivers/'s xserver-xorg-video-nouveau
amd64 1:1.0.11-1ubuntu3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450196603.5aBee3.24464
Date: Tue, 15 Dec 2015 16:23:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:swine&#64;pobox.com" title="peter swain &lt;swine&#64;pobox.com&gt;"> <span class="fn">peter swain</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>swine&#64;pobox.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:swine&#64;pobox.com" title="peter swain &lt;swine&#64;pobox.com&gt;"> <span class="fn">peter swain</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=120530" name="attach_120530" title="kern.log from 4.2.0-19-generic ubuntu-15.10 with dual-head NV44">attachment 120530</a> <a href="attachment.cgi?id=120530&amp;action=edit" title="kern.log from 4.2.0-19-generic ubuntu-15.10 with dual-head NV44">[details]</a></span>
kern.log from 4.2.0-19-generic ubuntu-15.10 with dual-head NV44

Working nicely until woken from overnight screen blanking, then the classic
ttm_validate issue.
This is with ppa.launchpad.net/graphics-drivers/'s xserver-xorg-video-nouveau
amd64 1:1.0.11-1ubuntu3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450196603.5aBee3.24464--

--===============0215045065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0215045065==--
