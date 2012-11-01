From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56347] NVPlatformProbe routine does not mark the
 entity as Shared for ZaphodHeads.
Date: Thu, 01 Nov 2012 21:12:32 +0000
Message-ID: <bug-56347-8800-hJXeK8lP8r@http.bugs.freedesktop.org/>
References: <bug-56347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1658071948=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56347-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1658071948==
Content-Type: multipart/alternative; boundary="1351804352.Be871e2.19635"; charset="us-ascii"


--1351804352.Be871e2.19635
Date: Thu, 1 Nov 2012 21:12:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56347

Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #4 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> ---
Nope, doesn't work. :(

http://upload.nowaker.net/nwkr/1351803759_Xorg.0.log
[  1809.910] (II) [drm] nouveau interface version: 1.0.0
[  1809.910] Requested Entity already in use!
[  1809.910] (II) [drm] nouveau interface version: 1.0.0
[  1809.910] (II) [drm] nouveau interface version: 1.0.0
[  1809.910] (EE) Screen 1 deleted because of no matching config section.

I applied all the four patches.
(full patch: http://upload.nowaker.net/nwkr/1351804213_xexaxo-diff)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351804352.Be871e2.19635
Date: Thu, 1 Nov 2012 21:12:32 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:nowaker&#64;geozone.pl" title="Damian Nowak &lt;nowaker&#64;geozone.pl&gt;"> <span class="fn">Damian Nowak</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">bug 56347</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">bug 56347</a>
              from <span class="vcard"><a class="email" href="mailto:nowaker&#64;geozone.pl" title="Damian Nowak &lt;nowaker&#64;geozone.pl&gt;"> <span class="fn">Damian Nowak</span></a>
</span></b>
        <pre>Nope, doesn't work. :(

<a href="http://upload.nowaker.net/nwkr/1351803759_Xorg.0.log">http://upload.nowaker.net/nwkr/1351803759_Xorg.0.log</a>
[  1809.910] (II) [drm] nouveau interface version: 1.0.0
[  1809.910] Requested Entity already in use!
[  1809.910] (II) [drm] nouveau interface version: 1.0.0
[  1809.910] (II) [drm] nouveau interface version: 1.0.0
[  1809.910] (EE) Screen 1 deleted because of no matching config section.

I applied all the four patches.
(full patch: <a href="http://upload.nowaker.net/nwkr/1351804213_xexaxo-diff">http://upload.nowaker.net/nwkr/1351804213_xexaxo-diff</a>)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351804352.Be871e2.19635--

--===============1658071948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1658071948==--
