From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75776] [NV50 gallium] Hearthstone displays corrupted
	buffers
Date: Wed, 05 Mar 2014 03:39:17 +0000
Message-ID: <bug-75776-8800-9aR7FQrAfE@http.bugs.freedesktop.org/>
References: <bug-75776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2066473290=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75776-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2066473290==
Content-Type: multipart/alternative; boundary="1393990757.Cd81A70.9167"; charset="us-ascii"


--1393990757.Cd81A70.9167
Date: Wed, 5 Mar 2014 03:39:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75776

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NVA5] Hearthstone displays |[NV50 gallium] Hearthstone
                   |corrupted buffers           |displays corrupted buffers

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Confirmed with latest on nv96 as well as Mesa 9.1.6. No errors in dmesg, but
this feels like an incorrect format somewhere, or an FBO attachment not being
output to. I checked with NV50_PROG_OPTIMIZE=0, and it's not a shader
optimization going wrong.

There are a few surface formats that are not blendable on nv50 but are on nvc0
(not 100% sure what "blendable" means... PIPE_BIND_BLENDABLE, whatever that
is). Perhaps it's trying to use one as blendable without declaring so...

There are some errors reported by glretrace, but I checked in the trace dump,
and they match the errors that the application received when doing the the fb
completeness checks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393990757.Cd81A70.9167
Date: Wed, 5 Mar 2014 03:39:17 +0000
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
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776">bug 75776</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NVA5] Hearthstone displays corrupted buffers
           </td>
           <td>[NV50 gallium] Hearthstone displays corrupted buffers
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776">bug 75776</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Confirmed with latest on nv96 as well as Mesa 9.1.6. No errors in dmesg, but
this feels like an incorrect format somewhere, or an FBO attachment not being
output to. I checked with NV50_PROG_OPTIMIZE=0, and it's not a shader
optimization going wrong.

There are a few surface formats that are not blendable on nv50 but are on nvc0
(not 100% sure what &quot;blendable&quot; means... PIPE_BIND_BLENDABLE, whatever that
is). Perhaps it's trying to use one as blendable without declaring so...

There are some errors reported by glretrace, but I checked in the trace dump,
and they match the errors that the application received when doing the the fb
completeness checks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393990757.Cd81A70.9167--

--===============2066473290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2066473290==--
