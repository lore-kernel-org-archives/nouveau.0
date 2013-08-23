From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68488] [NV86] Lockup and reboot on T61 with nouveau
	driver/exa
Date: Fri, 23 Aug 2013 21:32:14 +0000
Message-ID: <bug-68488-8800-VqfKnKhReM@http.bugs.freedesktop.org/>
References: <bug-68488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0207096353=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0207096353==
Content-Type: multipart/alternative; boundary="1377293534.dD4CDDB2.14526"; charset="us-ascii"


--1377293534.dD4CDDB2.14526
Date: Fri, 23 Aug 2013 21:32:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68488

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Lockup and reboot on T61    |[NV86] Lockup and reboot on
                   |with nouveau driver/exa     |T61 with nouveau driver/exa

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[ 79121.354] nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores
tiling

That usually means that the GPU has hung. The -12's are probably some print in
the driver reporting errors. The segfault in X appears to not be (directly)
nouveau-related, but it's also the least of your issues. If it didn't segfault,
it would have gotten killed anyways.

I think seeing a kernel log would be instructional. Can you reproduce this at
will? If it started happening recently, was there some sort of upgrade that
took place?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377293534.dD4CDDB2.14526
Date: Fri, 23 Aug 2013 21:32:14 +0000
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
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">bug 68488</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Lockup and reboot on T61 with nouveau driver/exa
           </td>
           <td>[NV86] Lockup and reboot on T61 with nouveau driver/exa
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">bug 68488</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[ 79121.354] nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores
tiling

That usually means that the GPU has hung. The -12's are probably some print in
the driver reporting errors. The segfault in X appears to not be (directly)
nouveau-related, but it's also the least of your issues. If it didn't segfault,
it would have gotten killed anyways.

I think seeing a kernel log would be instructional. Can you reproduce this at
will? If it started happening recently, was there some sort of upgrade that
took place?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377293534.dD4CDDB2.14526--

--===============0207096353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0207096353==--
