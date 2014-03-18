From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: data error enum documentation
Date: Tue, 18 Mar 2014 09:44:30 -0400
Message-ID: <CAKb7Uvjjpgn-r1HmsmmPpX=sdMcaE4TA=JBtRaVei-FDM8wZ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

A user on an NVC3 card (GF106) is running into data errors on m2mf
(class 0x9039) that we haven't seen before:

http://people.freedesktop.org/~imirkin/nvc0-comparison/nvc3-2014-03-17-agashlin/glean/fbo.html
http://people.freedesktop.org/~imirkin/nvc0-comparison/nvc3-2014-03-17-agashlin/spec/!OpenGL%201.1/copyteximage%201D.html

Specifically the data errors 0x51 and 0x53, when running method 0x300
("EXEC"). Any chance you could let us know what those errors are? (Or,
even better, provide the full table so that we'll have a better idea
in future cases as well.)

Here are a few that we know about, so you know exactly what table I'm
talking about (our full list at
https://github.com/envytools/envytools/blob/master/rnndb/nv50_defs.xml#L192):

0x04: INVALID_VALUE
0x05: INVALID_ENUM
0x08: INVALID_OBJECT
0x0c: INVALID_BITFIELD
0x3f: PRIMITIVE_ID_NEEDS_GP

We read this data error value from mmio reg 0x400110.

Furthermore, if you could provide any insight as to why we would see
those errors on GF106 but not any other Fermi/Kepler that we've tested
(which should all run exactly the same code paths), that would be
extremely helpful as well. You can see the Fermi piglit runs we have
on file at http://people.freedesktop.org/~imirkin/nvc0-comparison/problems.html

Thanks,

  -ilia
