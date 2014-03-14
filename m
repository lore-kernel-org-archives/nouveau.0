From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76173] New: xbmc green screen with vdpau enabled
Date: Fri, 14 Mar 2014 13:54:15 +0000
Message-ID: <bug-76173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0253143324=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0253143324==
Content-Type: multipart/alternative; boundary="1394805254.B178aC0.24710"; charset="us-ascii"


--1394805254.B178aC0.24710
Date: Fri, 14 Mar 2014 13:54:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76173

          Priority: medium
            Bug ID: 76173
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: xbmc green screen with vdpau enabled
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: serafean-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

When using xbmc with vdpau acceleration enabled, I get a green screen (audio
works), and this appears in the kernel log : 
nouveau E[   PFIFO][0000:03:00.0] DMA_PUSHER - ch 6 [xbmc.bin[22420]] get
0x00200f06c8 put 0x00200f0770 ib_get 0x000000db ib_put 0x000000dc state
0x80000000 (err: INVALID_CMD) push 0x00400040

Sometimes it makes xbmc crash completely.

This is on an nv50 (Chipset: MCP79/MCP7A (NVAC) ) : VGA compatible controller:
NVIDIA Corporation ION VGA (rev b1)

Mesa 10.1
libdrm 2.4.52

It works all right using mplayer.
Just a wild guess : something to do with GL_NV_vdpau_interop?

If you need any more information, I'd be happy to provide it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394805254.B178aC0.24710
Date: Fri, 14 Mar 2014 13:54:14 +0000
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
   title="NEW --- - xbmc green screen with vdpau enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76173">76173</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xbmc green screen with vdpau enabled
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>serafean&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.1
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
        <pre>When using xbmc with vdpau acceleration enabled, I get a green screen (audio
works), and this appears in the kernel log : 
nouveau E[   PFIFO][0000:03:00.0] DMA_PUSHER - ch 6 [xbmc.bin[22420]] get
0x00200f06c8 put 0x00200f0770 ib_get 0x000000db ib_put 0x000000dc state
0x80000000 (err: INVALID_CMD) push 0x00400040

Sometimes it makes xbmc crash completely.

This is on an nv50 (Chipset: MCP79/MCP7A (NVAC) ) : VGA compatible controller:
NVIDIA Corporation ION VGA (rev b1)

Mesa 10.1
libdrm 2.4.52

It works all right using mplayer.
Just a wild guess : something to do with GL_NV_vdpau_interop?

If you need any more information, I'd be happy to provide it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394805254.B178aC0.24710--

--===============0253143324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0253143324==--
