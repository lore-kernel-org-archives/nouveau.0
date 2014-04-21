From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77724] New: error: GLSL ES 3.00 is not supported.
 Supported versions are: 1.00 ES
Date: Mon, 21 Apr 2014 10:28:31 +0000
Message-ID: <bug-77724-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1560126704=="
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


--===============1560126704==
Content-Type: multipart/alternative; boundary="1398076110.7c4aa0.18842"; charset="us-ascii"


--1398076110.7c4aa0.18842
Date: Mon, 21 Apr 2014 10:28:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77724

          Priority: medium
            Bug ID: 77724
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: error: GLSL ES 3.00 is not supported. Supported
                    versions are: 1.00 ES
          Severity: blocker
    Classification: Unclassified
                OS: All
          Reporter: pulkitnandan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: All
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

I was trying to compile and run simple example programs from opengles
programming guide 2.0 for opengles 3.0 and got follwing error.

I build mesa while building wayland and it also have dri3 but it doenot loads
it.

Attaching the debug trace. What is the issue here and if follow exact
intructions from https://github.com/danginsburg/opengles3-book/ then it says to
use Powervr sdk which also results in similar error but with mesa egl following
is the trace.



libEGL debug: Native platform type: x11 (autodetected)
libEGL debug: EGL search path is /home/rnandan/install/lib/egl
libEGL debug: added egl_dri2 to module array
libEGL debug: DRI2: dlopen(/home/rnandan/install/lib/dri/nouveau_dri.so)
libEGL debug: driver does not expose __driDriverGetExtensions_nouveau():
/home/rnandan/install/lib/dri/nouveau_dri.so: undefined symbol:
__driDriverGetExtensions_nouveau

libEGL debug: DRI2: found extension `DRI_Core'
libEGL info: DRI2: found extension DRI_Core version 1
libEGL debug: DRI2: found extension `DRI_DRI2'
libEGL info: DRI2: found extension DRI_DRI2 version 4
libEGL debug: DRI2: found extension `DRI_ConfigOptions'
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libEGL debug: DRI2: found extension `DRI_TexBuffer'
libEGL info: DRI2: found extension DRI_TexBuffer version 2
libEGL debug: DRI2: found extension `DRI2_Flush'
libEGL info: DRI2: found extension DRI2_Flush version 4
libEGL debug: DRI2: found extension `DRI_IMAGE'
libEGL info: DRI2: found extension DRI_IMAGE version 8
libEGL debug: DRI2: found extension `DRI_CONFIG_QUERY'
libEGL debug: DRI2: found extension `DRI2_Throttle'
libEGL debug: the best driver is DRI2
Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Mesa: User error: GL_INVALID_VALUE in glAttachShader
Error linking program:
error: program lacks a vertex shader

libEGL debug: Display 0x1abaa80 is destroyed with resources
rnandan@rnandan-lt:~/opengles3-book/build$
Chapter_2/Hello_Triangle/./Hello_Triangle 
libEGL debug: Native platform type: x11 (autodetected)
libEGL debug: EGL search path is /home/rnandan/install/lib/egl
libEGL debug: added egl_dri2 to module array
libEGL debug: DRI2: dlopen(/home/rnandan/install/lib/dri/nouveau_dri.so)
libEGL debug: driver does not expose __driDriverGetExtensions_nouveau():
/home/rnandan/install/lib/dri/nouveau_dri.so: undefined symbol:
__driDriverGetExtensions_nouveau

libEGL debug: DRI2: found extension `DRI_Core'
libEGL info: DRI2: found extension DRI_Core version 1
libEGL debug: DRI2: found extension `DRI_DRI2'
libEGL info: DRI2: found extension DRI_DRI2 version 4
libEGL debug: DRI2: found extension `DRI_ConfigOptions'
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libEGL debug: DRI2: found extension `DRI_TexBuffer'
libEGL info: DRI2: found extension DRI_TexBuffer version 2
libEGL debug: DRI2: found extension `DRI2_Flush'
libEGL info: DRI2: found extension DRI2_Flush version 4
libEGL debug: DRI2: found extension `DRI_IMAGE'
libEGL info: DRI2: found extension DRI_IMAGE version 8
libEGL debug: DRI2: found extension `DRI_CONFIG_QUERY'
libEGL debug: DRI2: found extension `DRI2_Throttle'
libEGL debug: the best driver is DRI2
Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Mesa: User error: GL_INVALID_VALUE in glAttachShader
Error linking program:
error: program lacks a vertex shader

libEGL debug: Display 0x1a41a80 is destroyed with resources





with powervr sdk following is the trace. WHat is the problem with these.
While previously I was able to run all these examples with earlier version.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398076110.7c4aa0.18842
Date: Mon, 21 Apr 2014 10:28:30 +0000
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
   title="NEW --- - error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77724">77724</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
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
          <td>pulkitnandan&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
        <pre>I was trying to compile and run simple example programs from opengles
programming guide 2.0 for opengles 3.0 and got follwing error.

I build mesa while building wayland and it also have dri3 but it doenot loads
it.

Attaching the debug trace. What is the issue here and if follow exact
intructions from <a href="https://github.com/danginsburg/opengles3-book/">https://github.com/danginsburg/opengles3-book/</a> then it says to
use Powervr sdk which also results in similar error but with mesa egl following
is the trace.



libEGL debug: Native platform type: x11 (autodetected)
libEGL debug: EGL search path is /home/rnandan/install/lib/egl
libEGL debug: added egl_dri2 to module array
libEGL debug: DRI2: dlopen(/home/rnandan/install/lib/dri/nouveau_dri.so)
libEGL debug: driver does not expose __driDriverGetExtensions_nouveau():
/home/rnandan/install/lib/dri/nouveau_dri.so: undefined symbol:
__driDriverGetExtensions_nouveau

libEGL debug: DRI2: found extension `DRI_Core'
libEGL info: DRI2: found extension DRI_Core version 1
libEGL debug: DRI2: found extension `DRI_DRI2'
libEGL info: DRI2: found extension DRI_DRI2 version 4
libEGL debug: DRI2: found extension `DRI_ConfigOptions'
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libEGL debug: DRI2: found extension `DRI_TexBuffer'
libEGL info: DRI2: found extension DRI_TexBuffer version 2
libEGL debug: DRI2: found extension `DRI2_Flush'
libEGL info: DRI2: found extension DRI2_Flush version 4
libEGL debug: DRI2: found extension `DRI_IMAGE'
libEGL info: DRI2: found extension DRI_IMAGE version 8
libEGL debug: DRI2: found extension `DRI_CONFIG_QUERY'
libEGL debug: DRI2: found extension `DRI2_Throttle'
libEGL debug: the best driver is DRI2
Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Mesa: User error: GL_INVALID_VALUE in glAttachShader
Error linking program:
error: program lacks a vertex shader

libEGL debug: Display 0x1abaa80 is destroyed with resources
rnandan&#64;rnandan-lt:~/opengles3-book/build$
Chapter_2/Hello_Triangle/./Hello_Triangle 
libEGL debug: Native platform type: x11 (autodetected)
libEGL debug: EGL search path is /home/rnandan/install/lib/egl
libEGL debug: added egl_dri2 to module array
libEGL debug: DRI2: dlopen(/home/rnandan/install/lib/dri/nouveau_dri.so)
libEGL debug: driver does not expose __driDriverGetExtensions_nouveau():
/home/rnandan/install/lib/dri/nouveau_dri.so: undefined symbol:
__driDriverGetExtensions_nouveau

libEGL debug: DRI2: found extension `DRI_Core'
libEGL info: DRI2: found extension DRI_Core version 1
libEGL debug: DRI2: found extension `DRI_DRI2'
libEGL info: DRI2: found extension DRI_DRI2 version 4
libEGL debug: DRI2: found extension `DRI_ConfigOptions'
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libEGL debug: DRI2: found extension `DRI_TexBuffer'
libEGL info: DRI2: found extension DRI_TexBuffer version 2
libEGL debug: DRI2: found extension `DRI2_Flush'
libEGL info: DRI2: found extension DRI2_Flush version 4
libEGL debug: DRI2: found extension `DRI_IMAGE'
libEGL info: DRI2: found extension DRI_IMAGE version 8
libEGL debug: DRI2: found extension `DRI_CONFIG_QUERY'
libEGL debug: DRI2: found extension `DRI2_Throttle'
libEGL debug: the best driver is DRI2
Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Error compiling shader:
0:1(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES

Mesa: User error: GL_INVALID_VALUE in glAttachShader
Error linking program:
error: program lacks a vertex shader

libEGL debug: Display 0x1a41a80 is destroyed with resources





with powervr sdk following is the trace. WHat is the problem with these.
While previously I was able to run all these examples with earlier version.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398076110.7c4aa0.18842--

--===============1560126704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1560126704==--
