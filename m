From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49148] nv20_state_fb.c:50: get_rt_format: Assertion
	`0' failed.
Date: Wed, 21 Aug 2013 05:22:50 +0000
Message-ID: <bug-49148-8800-xjkF7tuXzc@http.bugs.freedesktop.org/>
References: <bug-49148-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0630547138=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49148-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0630547138==
Content-Type: multipart/alternative; boundary="1377062570.7F2Bff72.10849"; charset="us-ascii"


--1377062570.7F2Bff72.10849
Date: Wed, 21 Aug 2013 05:22:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49148

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so I tried on a NV18 with Mesa 9.2-git (as of a couple of days ago).
SweetHome3D, uh, "works", in that it doesn't crash. But the app is _really_
unhappy about the lack of cube map support, and the "3d" view is completely
messed up as a result. [It does seem as though nv10+ cards have cubemap
support, but the driver doesn't make use of that.]

That CriticalMass app also seems to work fine on wine 1.6.0 and mesa 9.2-git
(and also mesa 9.1.6).

Now, as to my analysis of the code, that assert() just plain can't happen. It's
inconceivable :) There aren't a lot of assignments to ->surface, and the only
values they can take on are the ones that get_rt_format expects (it either
assigns those values directly or copies them from other nouveau_surface
objects). Perhaps in older Mesa's that was not the case, I didn't dig _too_
deeply, but a small amount of digging didn't reveal any obvious fixes in this
area. Perhaps something was fixed in the surrounding mesa code.

So... please re-test with the latest mesa. If you still get the assert, run the
app inside GDB and provide the full backtrace. Also try to provide instructions
for how I could reproduce the issue, if it's more than just "start program X".

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377062570.7F2Bff72.10849
Date: Wed, 21 Aug 2013 05:22:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nv20_state_fb.c:50: get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49148">bug 49148</a>
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
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nv20_state_fb.c:50: get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49148#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nv20_state_fb.c:50: get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49148">bug 49148</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so I tried on a NV18 with Mesa 9.2-git (as of a couple of days ago).
SweetHome3D, uh, &quot;works&quot;, in that it doesn't crash. But the app is _really_
unhappy about the lack of cube map support, and the &quot;3d&quot; view is completely
messed up as a result. [It does seem as though nv10+ cards have cubemap
support, but the driver doesn't make use of that.]

That CriticalMass app also seems to work fine on wine 1.6.0 and mesa 9.2-git
(and also mesa 9.1.6).

Now, as to my analysis of the code, that assert() just plain can't happen. It's
inconceivable :) There aren't a lot of assignments to -&gt;surface, and the only
values they can take on are the ones that get_rt_format expects (it either
assigns those values directly or copies them from other nouveau_surface
objects). Perhaps in older Mesa's that was not the case, I didn't dig _too_
deeply, but a small amount of digging didn't reveal any obvious fixes in this
area. Perhaps something was fixed in the surrounding mesa code.

So... please re-test with the latest mesa. If you still get the assert, run the
app inside GDB and provide the full backtrace. Also try to provide instructions
for how I could reproduce the issue, if it's more than just &quot;start program X&quot;.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377062570.7F2Bff72.10849--

--===============0630547138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0630547138==--
