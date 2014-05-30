From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79462] New: [NVC0/Codegen] Shader compilation falis
 in spill logic
Date: Fri, 30 May 2014 18:44:00 +0000
Message-ID: <bug-79462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1492208214=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1492208214==
Content-Type: multipart/alternative; boundary="1401475439.0bADa0AD0.13512"; charset="us-ascii"


--1401475439.0bADa0AD0.13512
Date: Fri, 30 May 2014 18:43:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79462

          Priority: medium
            Bug ID: 79462
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVC0/Codegen] Shader compilation falis in spill logic
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 100179
  --> https://bugs.freedesktop.org/attachment.cgi?id=100179&action=edit
failing tgsi shader

The attached shader fails in the RA step, when inserting spill code:

nv50_ir::SpillCodeInserter::run (this=0x7ffffffec0c0, lst=std::list)
    at codegen/nv50_ir_ra.cpp:1561
1561             while (!dval->uses.empty()) {

Easily reproduced with nouveau_compiler -a c0. Apparently this shader is
generated as part of the d3d9 st, with skyrimlauncher, when it's trying to
detect the graphics card.

dval is null, which means that something out there isn't an lvalue. Or, in this
case, apparently a null value??

(gdb) p *defi
$4 = {_vptr.Instruction = 0x86e570, next = 0x0, prev = 0x0, id = -1, serial =
27, op = nv50_ir::OP_SPLIT, 
  dType = nv50_ir::TYPE_B128, sType = nv50_ir::TYPE_B128, cc = nv50_ir::CC_TR,
rnd = nv50_ir::ROUND_N, 
  cache = nv50_ir::CACHE_CA, subOp = 0, encSize = 0, saturate = 0, join = 0,
fixed = 0, terminator = 0, 
  ftz = 0, dnz = 0, ipa = 0, lanes = 15, perPatch = 0, exit = 0, mask = 0,
postFactor = 0 '\000', 
  predSrc = -1 '\377', flagsDef = -1 '\377', flagsSrc = -1 '\377', sched = 0,
bb = 0x0, 
  defs = std::deque with 4 elements = {{value = 0x0, origin = 0x0, insn =
0x200}, {value = 0x85ce30, 
      origin = 0x7ffff71a0698 <main_arena+88>, insn = 0x9e5e40}, {value = 0x0,
origin = 0x0, 
      insn = 0x9e5e40}, {value = 0x0, origin = 0x0, insn = 0x9e5e40}}, 
  srcs = std::deque with 1 elements = {{mod = {bits = 0 '\000'}, indirect =
"\377\377", 
      swizzle = 0 '\000', usedAsPtr = false, value = 0x0, insn = 0x200}}}

Note that the second def isn't null but the others are? Perhaps this happens as
part of dead code elimination? Need to investigate more.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401475439.0bADa0AD0.13512
Date: Fri, 30 May 2014 18:43:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0/Codegen] Shader compilation falis in spill logic"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79462">79462</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0/Codegen] Shader compilation falis in spill logic
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=100179" name="attach_100179" title="failing tgsi shader">attachment 100179</a> <a href="attachment.cgi?id=100179&amp;action=edit" title="failing tgsi shader">[details]</a></span>
failing tgsi shader

The attached shader fails in the RA step, when inserting spill code:

nv50_ir::SpillCodeInserter::run (this=0x7ffffffec0c0, lst=std::list)
    at codegen/nv50_ir_ra.cpp:1561
1561             while (!dval-&gt;uses.empty()) {

Easily reproduced with nouveau_compiler -a c0. Apparently this shader is
generated as part of the d3d9 st, with skyrimlauncher, when it's trying to
detect the graphics card.

dval is null, which means that something out there isn't an lvalue. Or, in this
case, apparently a null value??

(gdb) p *defi
$4 = {_vptr.Instruction = 0x86e570, next = 0x0, prev = 0x0, id = -1, serial =
27, op = nv50_ir::OP_SPLIT, 
  dType = nv50_ir::TYPE_B128, sType = nv50_ir::TYPE_B128, cc = nv50_ir::CC_TR,
rnd = nv50_ir::ROUND_N, 
  cache = nv50_ir::CACHE_CA, subOp = 0, encSize = 0, saturate = 0, join = 0,
fixed = 0, terminator = 0, 
  ftz = 0, dnz = 0, ipa = 0, lanes = 15, perPatch = 0, exit = 0, mask = 0,
postFactor = 0 '\000', 
  predSrc = -1 '\377', flagsDef = -1 '\377', flagsSrc = -1 '\377', sched = 0,
bb = 0x0, 
  defs = std::deque with 4 elements = {{value = 0x0, origin = 0x0, insn =
0x200}, {value = 0x85ce30, 
      origin = 0x7ffff71a0698 &lt;main_arena+88&gt;, insn = 0x9e5e40}, {value = 0x0,
origin = 0x0, 
      insn = 0x9e5e40}, {value = 0x0, origin = 0x0, insn = 0x9e5e40}}, 
  srcs = std::deque with 1 elements = {{mod = {bits = 0 '\000'}, indirect =
&quot;\377\377&quot;, 
      swizzle = 0 '\000', usedAsPtr = false, value = 0x0, insn = 0x200}}}

Note that the second def isn't null but the others are? Perhaps this happens as
part of dead code elimination? Need to investigate more.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401475439.0bADa0AD0.13512--

--===============1492208214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1492208214==--
