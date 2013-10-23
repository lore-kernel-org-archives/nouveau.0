From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70212] glxinfo triggers assert in cso_release_all
 after 3f0627c2ad6
Date: Wed, 23 Oct 2013 14:19:22 +0000
Message-ID: <bug-70212-8800-VLUNF3zmIq@http.bugs.freedesktop.org/>
References: <bug-70212-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0630336770=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70212-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0630336770==
Content-Type: multipart/alternative; boundary="1382537962.1bfbcc2.4376"; charset="us-ascii"


--1382537962.1bfbcc2.4376
Date: Wed, 23 Oct 2013 14:19:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70212

--- Comment #5 from Alen Skondro <askondro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I had the same problem with nv50. 
Now that I own an NVE4 the issue is gone, the assert passes.

in src/gallium/drivers/nvc0/nvc0_screen.c

 case PIPE_SHADER_CAP_MAX_TEXTURE_SAMPLERS:
254       return 16; /* would be 32 in linked (OpenGL-style) mode */
255       /*
256    case PIPE_SHADER_CAP_MAX_TEXTURE_SAMPLER_VIEWS:
257       return 32;
258       */

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382537962.1bfbcc2.4376
Date: Wed, 23 Oct 2013 14:19:22 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212">bug 70212</a>
              from <span class="vcard"><a class="email" href="mailto:askondro&#64;gmail.com" title="Alen Skondro &lt;askondro&#64;gmail.com&gt;"> <span class="fn">Alen Skondro</span></a>
</span></b>
        <pre>I had the same problem with nv50. 
Now that I own an NVE4 the issue is gone, the assert passes.

in src/gallium/drivers/nvc0/nvc0_screen.c

 case PIPE_SHADER_CAP_MAX_TEXTURE_SAMPLERS:
254       return 16; /* would be 32 in linked (OpenGL-style) mode */
255       /*
256    case PIPE_SHADER_CAP_MAX_TEXTURE_SAMPLER_VIEWS:
257       return 32;
258       */</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382537962.1bfbcc2.4376--

--===============0630336770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0630336770==--
