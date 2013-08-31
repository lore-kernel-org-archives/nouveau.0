From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56757] [NV42/NV30 gallium] UrbanTerror4.2 gets parts
 of images cut off
Date: Sat, 31 Aug 2013 06:11:11 +0000
Message-ID: <bug-56757-8800-o0vlMlENUu@http.bugs.freedesktop.org/>
References: <bug-56757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0729982735=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56757-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0729982735==
Content-Type: multipart/alternative; boundary="1377929471.500B01.26462"; charset="us-ascii"


--1377929471.500B01.26462
Date: Sat, 31 Aug 2013 06:11:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56757

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[regression][bisected][scre |[NV42/NV30 gallium]
                   |enshots] nvfx -> nv30       |UrbanTerror4.2 gets parts
                   |driver rework causes        |of images cut off
                   |regression in               |
                   |UrbanTerror4.2 (beta5)      |

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Just tested this out on NV42 with mesa ~9.2, and just clicking on "start
server" which brings up a settings screen shows half the settings cut off at
the bottom.

This ends up triggering the "swizzled and linear textures at the same time"
problem I've seen before, but I don't know if it's directly related -- that
tends to just not show textures at all/show stale data rather than cutting
stuff off.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377929471.500B01.26462
Date: Sat, 31 Aug 2013 06:11:11 +0000
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
   title="NEW --- - [NV42/NV30 gallium] UrbanTerror4.2 gets parts of images cut off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56757">bug 56757</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[regression][bisected][screenshots] nvfx -&gt; nv30 driver rework causes regression in UrbanTerror4.2 (beta5)
           </td>
           <td>[NV42/NV30 gallium] UrbanTerror4.2 gets parts of images cut off
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV42/NV30 gallium] UrbanTerror4.2 gets parts of images cut off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56757#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV42/NV30 gallium] UrbanTerror4.2 gets parts of images cut off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56757">bug 56757</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Just tested this out on NV42 with mesa ~9.2, and just clicking on &quot;start
server&quot; which brings up a settings screen shows half the settings cut off at
the bottom.

This ends up triggering the &quot;swizzled and linear textures at the same time&quot;
problem I've seen before, but I don't know if it's directly related -- that
tends to just not show textures at all/show stale data rather than cutting
stuff off.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377929471.500B01.26462--

--===============0729982735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0729982735==--
