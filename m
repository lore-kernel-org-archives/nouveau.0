From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71438] [NV10/nouveau_vieux] Application Konqueror
 crashes when connecting to asus.com
Date: Sat, 09 Nov 2013 21:40:51 +0000
Message-ID: <bug-71438-8800-y7yBpSXM9i@http.bugs.freedesktop.org/>
References: <bug-71438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1813456038=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1813456038==
Content-Type: multipart/alternative; boundary="1384033251.EF232.15214"; charset="us-ascii"


--1384033251.EF232.15214
Date: Sat, 9 Nov 2013 21:40:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71438

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Application Konqueror       |[NV10/nouveau_vieux]
                   |crashes when connecting to  |Application Konqueror
                   |asus.com                    |crashes when connecting to
                   |                            |asus.com

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The relevant bit of the stacktrace:

#10 0x42834a87 in __assert_fail () from /lib/libc.so.6
#11 0xaf348070 in nouveau_scratch_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#12 0xaf3436ed in nouveau_context_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#13 0xaf34d811 in nv10_context_create () from /usr/lib/dri/nouveau_vieux_dri.so
#14 0xaf343abd in nouveau_context_create () from
/usr/lib/dri/nouveau_vieux_dri.so
#15 0xaf36045f in dri2CreateContextAttribs () from
/usr/lib/dri/nouveau_vieux_dri.so
#16 0xaf360638 in dri2CreateNewContext () from
/usr/lib/dri/nouveau_vieux_dri.so
#17 0xb4032024 in dri2_create_context () from /lib/libGL.so.1
#18 0xb400824a in CreateContext () from /lib/libGL.so.1
#19 0xb4008541 in glXCreateContext () from /lib/libGL.so.1

And the code in nouveau_scratch_init:

    for (i = 0; i < NOUVEAU_SCRATCH_COUNT; i++) {
        ret = nouveau_bo_new(context_dev(ctx), NOUVEAU_BO_GART |
                     NOUVEAU_BO_MAP, 0, NOUVEAU_SCRATCH_SIZE,
                     NULL, &scratch->bo[i]);
        assert(!ret);

Looks like it's trying to get 2 3MB bo's, but it can't. Unfortunately error
handling is often done rather poorly in the nouveau_vieux driver (via asserts
rather than returning error codes).

What card are you using? How much VRAM does it have? What resolution are you
running your screen at? What kernel are you on? What version of
xf86-video-nouveau and mesa are you using?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384033251.EF232.15214
Date: Sat, 9 Nov 2013 21:40:51 +0000
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
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438">bug 71438</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Application Konqueror crashes when connecting to asus.com
           </td>
           <td>[NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10/nouveau_vieux] Application Konqueror crashes when connecting to asus.com"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71438">bug 71438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The relevant bit of the stacktrace:

#10 0x42834a87 in __assert_fail () from /lib/libc.so.6
#11 0xaf348070 in nouveau_scratch_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#12 0xaf3436ed in nouveau_context_init () from
/usr/lib/dri/nouveau_vieux_dri.so
#13 0xaf34d811 in nv10_context_create () from /usr/lib/dri/nouveau_vieux_dri.so
#14 0xaf343abd in nouveau_context_create () from
/usr/lib/dri/nouveau_vieux_dri.so
#15 0xaf36045f in dri2CreateContextAttribs () from
/usr/lib/dri/nouveau_vieux_dri.so
#16 0xaf360638 in dri2CreateNewContext () from
/usr/lib/dri/nouveau_vieux_dri.so
#17 0xb4032024 in dri2_create_context () from /lib/libGL.so.1
#18 0xb400824a in CreateContext () from /lib/libGL.so.1
#19 0xb4008541 in glXCreateContext () from /lib/libGL.so.1

And the code in nouveau_scratch_init:

    for (i = 0; i &lt; NOUVEAU_SCRATCH_COUNT; i++) {
        ret = nouveau_bo_new(context_dev(ctx), NOUVEAU_BO_GART |
                     NOUVEAU_BO_MAP, 0, NOUVEAU_SCRATCH_SIZE,
                     NULL, &amp;scratch-&gt;bo[i]);
        assert(!ret);

Looks like it's trying to get 2 3MB bo's, but it can't. Unfortunately error
handling is often done rather poorly in the nouveau_vieux driver (via asserts
rather than returning error codes).

What card are you using? How much VRAM does it have? What resolution are you
running your screen at? What kernel are you on? What version of
xf86-video-nouveau and mesa are you using?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384033251.EF232.15214--

--===============1813456038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1813456038==--
