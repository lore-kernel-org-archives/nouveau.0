From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61635] glVertexAttribPointer(id, GL_UNSIGNED_BYTE,
 GL_FALSE, ...) does not work
Date: Tue, 13 Aug 2013 17:49:28 +0000
Message-ID: <bug-61635-8800-Seu0vV3a6x@http.bugs.freedesktop.org/>
References: <bug-61635-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0812373849=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61635-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0812373849==
Content-Type: multipart/alternative; boundary="1376416167.5E8A082.28535"; charset="us-ascii"


--1376416167.5E8A082.28535
Date: Tue, 13 Aug 2013 17:49:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61635

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
FTR, removing

   _(R8_USCALED          , U8_USCALED , 1),
   _(R8G8_USCALED        , U8_USCALED , 2),
   _(R8G8B8_USCALED      , U8_USCALED , 3),
   _(R8G8B8A8_USCALED    , U8_USCALED , 4),

from nv30_format.c appears to fix the sample program that you had (it falls
back to R32G32_FLOAT). Obviously that's probably not the right approach
overall... perhaps those should all be UNORM/SNORM instead of UNORM/USCALED...
or SNORM/SSCALED...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376416167.5E8A082.28535
Date: Tue, 13 Aug 2013 17:49:27 +0000
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
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635">bug 61635</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>FTR, removing

   _(R8_USCALED          , U8_USCALED , 1),
   _(R8G8_USCALED        , U8_USCALED , 2),
   _(R8G8B8_USCALED      , U8_USCALED , 3),
   _(R8G8B8A8_USCALED    , U8_USCALED , 4),

from nv30_format.c appears to fix the sample program that you had (it falls
back to R32G32_FLOAT). Obviously that's probably not the right approach
overall... perhaps those should all be UNORM/SNORM instead of UNORM/USCALED...
or SNORM/SSCALED...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376416167.5E8A082.28535--

--===============0812373849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0812373849==--
