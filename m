From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79462] [NVC0/Codegen] Shader compilation falis in
	spill logic
Date: Thu, 31 Jul 2014 18:35:19 +0000
Message-ID: <bug-79462-8800-OviE8P6bUc@http.bugs.freedesktop.org/>
References: <bug-79462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1482493527=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1482493527==
Content-Type: multipart/alternative; boundary="1406831719.BB26e1.7767"; charset="us-ascii"


--1406831719.BB26e1.7767
Date: Thu, 31 Jul 2014 18:35:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79462

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The below patch helps avoid the crash, but it still still generate incorrect
code. I think there are a few issues here, and I'll have to think a little
harder about how to properly resolve them.


diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 5ab6570..89c83cb 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -1576,7 +1576,8 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)

          assert(defi);
          if (defi->isPseudo()) {
-            d = lval->defs.erase(d);
+            while (d != lval->defs.end() && (*d)->getInsn() == defi)
+               d = lval->defs.erase(d);
             --d;
             if (slot->reg.file == FILE_MEMORY_LOCAL)
                delete_Instruction(func->getProgram(), defi);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1406831719.BB26e1.7767
Date: Thu, 31 Jul 2014 18:35:19 +0000
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
   title="NEW --- - [NVC0/Codegen] Shader compilation falis in spill logic"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79462#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0/Codegen] Shader compilation falis in spill logic"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79462">bug 79462</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The below patch helps avoid the crash, but it still still generate incorrect
code. I think there are a few issues here, and I'll have to think a little
harder about how to properly resolve them.


diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 5ab6570..89c83cb 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
&#64;&#64; -1576,7 +1576,8 &#64;&#64; SpillCodeInserter::run(const std::list&lt;ValuePair&gt;&amp; lst)

          assert(defi);
          if (defi-&gt;isPseudo()) {
-            d = lval-&gt;defs.erase(d);
+            while (d != lval-&gt;defs.end() &amp;&amp; (*d)-&gt;getInsn() == defi)
+               d = lval-&gt;defs.erase(d);
             --d;
             if (slot-&gt;reg.file == FILE_MEMORY_LOCAL)
                delete_Instruction(func-&gt;getProgram(), defi);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1406831719.BB26e1.7767--

--===============1482493527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1482493527==--
