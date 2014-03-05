From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75776] [NV50 gallium] Hearthstone displays corrupted
	buffers
Date: Wed, 05 Mar 2014 03:53:20 +0000
Message-ID: <bug-75776-8800-tGdKEvy2TP@http.bugs.freedesktop.org/>
References: <bug-75776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0652208490=="
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


--===============0652208490==
Content-Type: multipart/alternative; boundary="1393991600.bCeFd8fD0.11567"; charset="us-ascii"


--1393991600.bCeFd8fD0.11567
Date: Wed, 5 Mar 2014 03:53:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75776

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Another thing I noticed is lots of compressed texture usage
(GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT). What happens if you run it with

MESA_EXTENSION_OVERRIDE=-GL_EXT_texture_compression_s3tc

in the environment? Does that fix things? (I can't really test on the trace,
since the trace only has the compressed content.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393991600.bCeFd8fD0.11567
Date: Wed, 5 Mar 2014 03:53:20 +0000
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
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776">bug 75776</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Another thing I noticed is lots of compressed texture usage
(GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT). What happens if you run it with

MESA_EXTENSION_OVERRIDE=-GL_EXT_texture_compression_s3tc

in the environment? Does that fix things? (I can't really test on the trace,
since the trace only has the compressed content.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393991600.bCeFd8fD0.11567--

--===============0652208490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0652208490==--
