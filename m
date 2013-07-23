From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67215] New: UBO access seems to mask address on
	nouveau
Date: Tue, 23 Jul 2013 11:57:50 +0000
Message-ID: <bug-67215-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1367984639=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1367984639==
Content-Type: multipart/alternative; boundary="1374580670.DFFDE0.31228"; charset="us-ascii"


--1374580670.DFFDE0.31228
Date: Tue, 23 Jul 2013 11:57:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67215

          Priority: medium
            Bug ID: 67215
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: UBO access seems to mask address on nouveau
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: wickmarkus-S0/GAf8tV78@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Hi,

The UBO support seems to be broken when used with dolphin-emu. To try it
yourself, I created an apitrace dump:
http://markus.members.selfnet.de/dolphin/dolphin-emu.trace (~48M)
This works fine on i965 and r600g, but it only show some random polygons on
nouveau.

This bug only happens when the uniform buffer is bigger than 64k bytes. More
precisely it happens when any read offset (related to buffer begin) goes above
the 64k mark.
The offset per uniform block is restricted to 64k, but the offsets per uniform
buffers should allow to access the complete memory.

It seems that the shader fetch mask locations to the first 64k bytes of the
buffer. To proove this, I moved the uniform block to offset 63k so that the
first 1k bytes are read correctly and everything else starts at zero.
My uniform buffer was 128k big and I copyed as I wanted to proove and I got a
correct rendering.

I think the mask is because of 16bit indices for uniform locations. This is
valid for uniform block offsets, but not for uniform buffer offsets.
eg:

u16 uniform_block_offset_per_variable; // hard coded in shader
u32 uniform_buffer_offset_per_uniform_block; // set by glBindBufferRange
u8* uniform_buffer_base; // location of this uniform buffer

// The way I think it's done:
u8* fetched_location = uniform_buffer_base +
u16(uniform_buffer_offset_per_uniform_block +
uniform_block_offset_per_variable);

// The correct way:
u8* fetched_location = uniform_buffer_base +
uniform_buffer_offset_per_uniform_block +
u32(uniform_block_offset_per_variable);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374580670.DFFDE0.31228
Date: Tue, 23 Jul 2013 11:57:50 +0000
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
   title="NEW --- - UBO access seems to mask address on nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67215">67215</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>UBO access seems to mask address on nouveau
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
          <td>wickmarkus&#64;web.de
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
          <td>git
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
        <pre>Hi,

The UBO support seems to be broken when used with dolphin-emu. To try it
yourself, I created an apitrace dump:
<a href="http://markus.members.selfnet.de/dolphin/dolphin-emu.trace">http://markus.members.selfnet.de/dolphin/dolphin-emu.trace</a> (~48M)
This works fine on i965 and r600g, but it only show some random polygons on
nouveau.

This bug only happens when the uniform buffer is bigger than 64k bytes. More
precisely it happens when any read offset (related to buffer begin) goes above
the 64k mark.
The offset per uniform block is restricted to 64k, but the offsets per uniform
buffers should allow to access the complete memory.

It seems that the shader fetch mask locations to the first 64k bytes of the
buffer. To proove this, I moved the uniform block to offset 63k so that the
first 1k bytes are read correctly and everything else starts at zero.
My uniform buffer was 128k big and I copyed as I wanted to proove and I got a
correct rendering.

I think the mask is because of 16bit indices for uniform locations. This is
valid for uniform block offsets, but not for uniform buffer offsets.
eg:

u16 uniform_block_offset_per_variable; // hard coded in shader
u32 uniform_buffer_offset_per_uniform_block; // set by glBindBufferRange
u8* uniform_buffer_base; // location of this uniform buffer

// The way I think it's done:
u8* fetched_location = uniform_buffer_base +
u16(uniform_buffer_offset_per_uniform_block +
uniform_block_offset_per_variable);

// The correct way:
u8* fetched_location = uniform_buffer_base +
uniform_buffer_offset_per_uniform_block +
u32(uniform_block_offset_per_variable);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374580670.DFFDE0.31228--

--===============1367984639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1367984639==--
