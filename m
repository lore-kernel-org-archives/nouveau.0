From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58428] [NVA8] X crashes when running opengl
 application after reclocking nouveau driver to use highest speed
Date: Fri, 06 Sep 2013 22:22:34 +0000
Message-ID: <bug-58428-8800-doMo8CcDSt@http.bugs.freedesktop.org/>
References: <bug-58428-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1363250204=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58428-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1363250204==
Content-Type: multipart/alternative; boundary="1378506154.3DFec2.28558"; charset="us-ascii"


--1378506154.3DFec2.28558
Date: Fri, 6 Sep 2013 22:22:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58428

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|X crashes when running      |[NVA8] X crashes when
                   |opengl application after    |running opengl application
                   |reclocking nouveau driver   |after reclocking nouveau
                   |to use highest speed        |driver to use highest speed

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Does this happen if you don't do any reclocking? If so, let's get reclocking
out of the picture.

If not, you could try a newer kernel, but I think in general, reclocking isn't
really supported (you probably noticed that you had to add a special parameter
to get it to work, that's not a coincidence). I think some work is currently
being done for the NVA3+ cards, you could try to find out status in #nouveau on
freenode if you're interested.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378506154.3DFec2.28558
Date: Fri, 6 Sep 2013 22:22:34 +0000
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
   title="NEW --- - [NVA8] X crashes when running opengl application after reclocking nouveau driver to use highest speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58428">bug 58428</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>X crashes when running opengl application after reclocking nouveau driver to use highest speed
           </td>
           <td>[NVA8] X crashes when running opengl application after reclocking nouveau driver to use highest speed
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] X crashes when running opengl application after reclocking nouveau driver to use highest speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58428#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] X crashes when running opengl application after reclocking nouveau driver to use highest speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58428">bug 58428</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Does this happen if you don't do any reclocking? If so, let's get reclocking
out of the picture.

If not, you could try a newer kernel, but I think in general, reclocking isn't
really supported (you probably noticed that you had to add a special parameter
to get it to work, that's not a coincidence). I think some work is currently
being done for the NVA3+ cards, you could try to find out status in #nouveau on
freenode if you're interested.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378506154.3DFec2.28558--

--===============1363250204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1363250204==--
