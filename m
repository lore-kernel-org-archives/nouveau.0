From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95190] Tomb Raider with PostProcessing enable and
 Depth of Field set to Ultra has white stuff in the foreground
Date: Thu, 28 Apr 2016 22:17:40 +0000
Message-ID: <bug-95190-8800-lnHPLc662T@http.bugs.freedesktop.org/>
References: <bug-95190-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1583765778=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95190-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1583765778==
Content-Type: multipart/alternative; boundary="14618818600.bacF.17284";
 charset="UTF-8"


--14618818600.bacF.17284
Date: Thu, 28 Apr 2016 22:17:40 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95190

Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |major
          Component|Drivers/DRI/nouveau         |glsl-compiler
                 CC|                            |kenneth-xkhwgxqQjnbNLxjTenLetw@public.gmane.org,
                   |                            |samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
                   |rg                          |
         QA Contact|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |intel-3d-bugs-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org
                   |rg                          |ktop.org

--- Comment #4 from Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So, the issue is that the count_uniforms_size pass which is used to calculate
the storage requirements for a set of uniform has a bug for constant arrays.

The problem is that the pass aggregates the size of a constant array each time
it finds a reference in the shader source.

For example, in the attached shader, the lowering pass returns 95484k of
uniforms but it should be 1308k (327*4) (+ some other things). The 95484 is
computed as follow: 327 * 4 * 73 (number of occurences of icb in the shader).

I had a look at the code, and I think that the correct solution should be to do
this lowering pass only once for constant arrays (this will require to somehow
remember which one has been lowered though).

Ken, can you look into this?
Thanks in advance.

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14618818600.bacF.17284
Date: Thu, 28 Apr 2016 22:17:40 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:samuel.pitoiset&#64;gmail.com" title="Samuel Pitoiset &lt;samuel.pitoiset&#64;gmail.com&gt;"> <span class="fn">Samuel Pitoiset</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider with PostProcessing enable and Depth of Field set to Ultra has white stuff in the foreground"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95190">bug 95190</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Severity</td>
           <td>normal
           </td>
           <td>major
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>glsl-compiler
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>kenneth&#64;whitecape.org, samuel.pitoiset&#64;gmail.com
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>idr&#64;freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>intel-3d-bugs&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider with PostProcessing enable and Depth of Field set to Ultra has white stuff in the foreground"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95190#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider with PostProcessing enable and Depth of Field set to Ultra has white stuff in the foreground"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95190">bug 95190</a>
              from <span class="vcard"><a class="email" href="mailto:samuel.pitoiset&#64;gmail.com" title="Samuel Pitoiset &lt;samuel.pitoiset&#64;gmail.com&gt;"> <span class="fn">Samuel Pitoiset</span></a>
</span></b>
        <pre>So, the issue is that the count_uniforms_size pass which is used to calculate
the storage requirements for a set of uniform has a bug for constant arrays.

The problem is that the pass aggregates the size of a constant array each time
it finds a reference in the shader source.

For example, in the attached shader, the lowering pass returns 95484k of
uniforms but it should be 1308k (327*4) (+ some other things). The 95484 is
computed as follow: 327 * 4 * 73 (number of occurences of icb in the shader).

I had a look at the code, and I think that the correct solution should be to do
this lowering pass only once for constant arrays (this will require to somehow
remember which one has been lowered though).

Ken, can you look into this?
Thanks in advance.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14618818600.bacF.17284--

--===============1583765778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1583765778==--
