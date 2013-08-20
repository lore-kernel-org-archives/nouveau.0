From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56721] [NV4A] Nouveau driver fails on nv40 with
 error -12 (out of memory)
Date: Tue, 20 Aug 2013 23:39:04 +0000
Message-ID: <bug-56721-8800-2kr3vrxOTI@http.bugs.freedesktop.org/>
References: <bug-56721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0665360291=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0665360291==
Content-Type: multipart/alternative; boundary="1377041944.CcB32.17793"; charset="us-ascii"


--1377041944.CcB32.17793
Date: Tue, 20 Aug 2013 23:39:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56721

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Nouveau driver fails on     |[NV4A] Nouveau driver fails
                   |nv40 with error -12 (out of |on nv40 with error -12 (out
                   |memory)                     |of memory)

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Has this improved on the latest kernels? If not, could you try a 3.2 kernel?
(There was another bug that identified dea7e0ac45fd as the cause of an
unrelated-seeming issue, but *was* AGP-related.)

Please be sure to supply a dmesg from every kernel you try.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377041944.CcB32.17793
Date: Tue, 20 Aug 2013 23:39:04 +0000
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
   title="NEW --- - [NV4A] Nouveau driver fails on nv40 with error -12 (out of memory)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56721">bug 56721</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Nouveau driver fails on nv40 with error -12 (out of memory)
           </td>
           <td>[NV4A] Nouveau driver fails on nv40 with error -12 (out of memory)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4A] Nouveau driver fails on nv40 with error -12 (out of memory)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56721#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4A] Nouveau driver fails on nv40 with error -12 (out of memory)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56721">bug 56721</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Has this improved on the latest kernels? If not, could you try a 3.2 kernel?
(There was another bug that identified dea7e0ac45fd as the cause of an
unrelated-seeming issue, but *was* AGP-related.)

Please be sure to supply a dmesg from every kernel you try.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377041944.CcB32.17793--

--===============0665360291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0665360291==--
