From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] [NV44] dual-link tmds no longer allowed
Date: Wed, 05 Feb 2014 04:18:15 +0000
Message-ID: <bug-40747-8800-Us8M1lrb4C@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2083201747=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2083201747==
Content-Type: multipart/alternative; boundary="1391573895.41ef24E5.3377"; charset="us-ascii"


--1391573895.41ef24E5.3377
Date: Wed, 5 Feb 2014 04:18:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|The new nouveau kernel      |[NV44] dual-link tmds no
                   |module fails to use my      |longer allowed
                   |monitor's native resolution |

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I don't think there's any issue detecting the 1600x1200 mode. All your earlier
logs appear to indicate it's detected correctly. The issue is that your card is
not being detected as dual-link-capable, and the 1600x1200 mode without reduced
blanking won't work on it.

I have a NV44 and NV42 card, and neither have had trouble getting 1920x1200
going. However an NV34 card can't go beyond 1600x1200 on digital (TMDS).

Could you upload a copy of your vbios (/sys/kernel/debug/dri/0/vbios.rom)? Also
can you try hacking up your kernel, see
nouveau_connector.c:nouveau_connector_mode_valid

if (nouveau_duallink && nv_encoder->dcb->duallink_possible)
    max_clock *= 2;

Just get rid of the if statement so that the max_clock *= 2 is always done.
Perhaps the nv_device(drm->device)->chipset > 0x46 is wrong in
get_tmds_link_bandwidth and it should actually be >= 0x44... although that
feels more like a difference between geforce 6- and 7-series. (But then it
picks up the igp's as well as the nv4a which is supposed to be just like the
nv44...)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391573895.41ef24E5.3377
Date: Wed, 5 Feb 2014 04:18:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>The new nouveau kernel module fails to use my monitor's native resolution
           </td>
           <td>[NV44] dual-link tmds no longer allowed
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I don't think there's any issue detecting the 1600x1200 mode. All your earlier
logs appear to indicate it's detected correctly. The issue is that your card is
not being detected as dual-link-capable, and the 1600x1200 mode without reduced
blanking won't work on it.

I have a NV44 and NV42 card, and neither have had trouble getting 1920x1200
going. However an NV34 card can't go beyond 1600x1200 on digital (TMDS).

Could you upload a copy of your vbios (/sys/kernel/debug/dri/0/vbios.rom)? Also
can you try hacking up your kernel, see
nouveau_connector.c:nouveau_connector_mode_valid

if (nouveau_duallink &amp;&amp; nv_encoder-&gt;dcb-&gt;duallink_possible)
    max_clock *= 2;

Just get rid of the if statement so that the max_clock *= 2 is always done.
Perhaps the nv_device(drm-&gt;device)-&gt;chipset &gt; 0x46 is wrong in
get_tmds_link_bandwidth and it should actually be &gt;= 0x44... although that
feels more like a difference between geforce 6- and 7-series. (But then it
picks up the igp's as well as the nv4a which is supposed to be just like the
nv44...)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391573895.41ef24E5.3377--

--===============2083201747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2083201747==--
