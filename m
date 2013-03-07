From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61854] [nv50]glClipPlane not clipping correctly for
	glsl
Date: Thu, 07 Mar 2013 18:35:51 +0000
Message-ID: <bug-61854-8800-M6aoUDtZzT@http.bugs.freedesktop.org/>
References: <bug-61854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1977373245=="
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


--===============1977373245==
Content-Type: multipart/alternative; boundary="1362681351.5bdDA3461.32722"; charset="us-ascii"


--1362681351.5bdDA3461.32722
Date: Thu, 7 Mar 2013 18:35:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61854

--- Comment #2 from Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> ---
__GLSL_CG_DATA_TYPES is an NV blob-specific feature related to Cg. How does
that have anything to do with gl_ClipVertex ? And no, there's no way we're
going to define it with mesa.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362681351.5bdDA3461.32722
Date: Thu, 7 Mar 2013 18:35:51 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61854#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv50]glClipPlane not clipping correctly for glsl"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61854">bug 61854</a>
              from <span class="vcard"><a class="email" href="mailto:e0425955&#64;student.tuwien.ac.at" title="Christoph Bumiller &lt;e0425955&#64;student.tuwien.ac.at&gt;"> <span class="fn">Christoph Bumiller</span></a>
</span></b>
        <pre>__GLSL_CG_DATA_TYPES is an NV blob-specific feature related to Cg. How does
that have anything to do with gl_ClipVertex ? And no, there's no way we're
going to define it with mesa.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362681351.5bdDA3461.32722--

--===============1977373245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1977373245==--
