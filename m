From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 10 Jan 2014 18:04:25 +0000
Message-ID: <bug-73358-8800-dbnRUFIaPZ@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0793131113=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0793131113==
Content-Type: multipart/alternative; boundary="1389377065.6d2a7ab2.12509"; charset="us-ascii"


--1389377065.6d2a7ab2.12509
Date: Fri, 10 Jan 2014 18:04:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What are 10.3 and 11.1 references to? Flash?

FWIW

subc 7 class 0x0697 mthd 0x0208 data 0x00000120

decodes to

$ lookup -a 34 -d NV01_SUBCHAN -- -v obj-class NV34_3D 208 120
RT_FORMAT => { COLOR = 0 | ZETA = Z16 | TYPE = LINEAR | LOG2_WIDTH = 0 |
LOG2_HEIGHT = 0 }

Based on the fact that COLOR isn't set, something highly illegal is happening.
I don't see any paths that would leave COLOR unset, unless somehow an illegal
format was being used. And since the process in question is plugin-container,
that means that opengl is being used (otherwise you'd see Xorg as the process
or something).

It'd be fantastic if you could get an apitrace of this. I don't know if
apitrace follows exec'd processes, but I hope it does. If not, at the very
least an ltrace may prove useful (restricted to opengl, of course).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389377065.6d2a7ab2.12509
Date: Fri, 10 Jan 2014 18:04:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What are 10.3 and 11.1 references to? Flash?

FWIW

subc 7 class 0x0697 mthd 0x0208 data 0x00000120

decodes to

$ lookup -a 34 -d NV01_SUBCHAN -- -v obj-class NV34_3D 208 120
RT_FORMAT =&gt; { COLOR = 0 | ZETA = Z16 | TYPE = LINEAR | LOG2_WIDTH = 0 |
LOG2_HEIGHT = 0 }

Based on the fact that COLOR isn't set, something highly illegal is happening.
I don't see any paths that would leave COLOR unset, unless somehow an illegal
format was being used. And since the process in question is plugin-container,
that means that opengl is being used (otherwise you'd see Xorg as the process
or something).

It'd be fantastic if you could get an apitrace of this. I don't know if
apitrace follows exec'd processes, but I hope it does. If not, at the very
least an ltrace may prove useful (restricted to opengl, of course).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389377065.6d2a7ab2.12509--

--===============0793131113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0793131113==--
