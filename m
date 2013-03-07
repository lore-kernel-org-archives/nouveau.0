From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61854] [nv50]glClipPlane not clipping correctly for
	glsl
Date: Thu, 07 Mar 2013 13:01:27 +0000
Message-ID: <bug-61854-8800-57rHPv3QSc@http.bugs.freedesktop.org/>
References: <bug-61854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0939851479=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61854-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0939851479==
Content-Type: multipart/alternative; boundary="1362661287.bAC5B48c0.31083"; charset="us-ascii"


--1362661287.bAC5B48c0.31083
Date: Thu, 7 Mar 2013 13:01:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61854

--- Comment #1 from bill-xUg5jqCTrWtAfugRpC6u6w@public.gmane.org ---
Ok, thank's to calim's help, it turns out that blender wasn't writing to
gl_ClipVertex. However, this is because __GLSL_CG_DATA_TYPES is not defined.
Should nouveau define it? Or is there another define that can be used in
blender's shader?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362661287.bAC5B48c0.31083
Date: Thu, 7 Mar 2013 13:01:27 +0000
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
   title="NEW --- - [nv50]glClipPlane not clipping correctly for glsl"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61854#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv50]glClipPlane not clipping correctly for glsl"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61854">bug 61854</a>
              from <span class="vcard"><a class="email" href="mailto:bill&#64;taniwha.org" title="bill&#64;taniwha.org">bill&#64;taniwha.org</a>
</span></b>
        <pre>Ok, thank's to calim's help, it turns out that blender wasn't writing to
gl_ClipVertex. However, this is because __GLSL_CG_DATA_TYPES is not defined.
Should nouveau define it? Or is there another define that can be used in
blender's shader?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362661287.bAC5B48c0.31083--

--===============0939851479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0939851479==--
