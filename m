From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] [NV4E] [drm:drm_crtc_helper_set_config]
 *ERROR* failed to set mode on [CRTC:6]
Date: Wed, 21 Aug 2013 00:00:42 +0000
Message-ID: <bug-31961-8800-XjhAIGo71l@http.bugs.freedesktop.org/>
References: <bug-31961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703519443=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1703519443==
Content-Type: multipart/alternative; boundary="1377043242.8F5d873.20935"; charset="us-ascii"


--1377043242.8F5d873.20935
Date: Wed, 21 Aug 2013 00:00:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31961

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[drm:drm_crtc_helper_set_co |[NV4E]
                   |nfig] *ERROR* failed to set |[drm:drm_crtc_helper_set_co
                   |mode on [CRTC:6]            |nfig] *ERROR* failed to set
                   |                            |mode on [CRTC:6]

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Could you retest this on the latest kernel? Also, after reading all the
comments, it's still not really clear to me what the problem is? An annoying
print in dmesg? What's the effect of the bug? nouveau will always detect
phantom connectors, they're there, just not pinned out on your
motherboard/whatever.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377043242.8F5d873.20935
Date: Wed, 21 Aug 2013 00:00:42 +0000
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
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961">bug 31961</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
           </td>
           <td>[NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961">bug 31961</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Could you retest this on the latest kernel? Also, after reading all the
comments, it's still not really clear to me what the problem is? An annoying
print in dmesg? What's the effect of the bug? nouveau will always detect
phantom connectors, they're there, just not pinned out on your
motherboard/whatever.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377043242.8F5d873.20935--

--===============1703519443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1703519443==--
