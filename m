From: "Aaron Whitehouse" <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org>
Subject: Renouoveau hangs on 79th test on 8800 GT
Date: Sat, 7 Jun 2008 22:21:17 +1200
Message-ID: <196947f20806070321jdbb037du67fd911278c2732@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_17563_12174822.1212834077871"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

------=_Part_17563_12174822.1212834077871
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I am still trying to get you a dump from my brother's 8800 (because
the dumps page says that you have never received one).

The computer has a nVidia Corporation GeForce 8800 GT (rev a2) and I
am running Koala's script.

It compiles and runs through most of the tests properly, but
consistently hangs indefinitely on the 79th test until I press Ctrl+C
and quit the program.

The output is:
9/80 test_draw_buffer
No Stereo context. Skipping stereo tests
No double buffering. Skipping double buffer tests
No GL_EXT_vertex_weighting extension.
No GL_NV_texgen_emboss extension.
GL_NV_vertex_program3 crashes up until driver 100.14.19 on G80 - skipping.
79/80 test_arb_vertex_buffer_object_indexed

The output of lspci is attached. Please let me know if I can get you
any further logs or anything else that would assist you.

Regards,

Aaron

-- 
FSF Associate Member: 5632
http://www.fsf.org

------=_Part_17563_12174822.1212834077871
Content-Type: text/plain; name=lspci.txt
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fh60kdm80
Content-Disposition: attachment; filename=lspci.txt

MDA6MDAuMCBSQU0gbWVtb3J5OiBuVmlkaWEgQ29ycG9yYXRpb24gTUNQNjUgTWVtb3J5IENvbnRy
b2xsZXIgKHJldiBhMykKMDA6MDEuMCBJU0EgYnJpZGdlOiBuVmlkaWEgQ29ycG9yYXRpb24gTUNQ
NjUgTFBDIEJyaWRnZSAocmV2IGEzKQowMDowMS4xIFNNQnVzOiBuVmlkaWEgQ29ycG9yYXRpb24g
TUNQNjUgU01CdXMgKHJldiBhMSkKMDA6MDEuMiBSQU0gbWVtb3J5OiBuVmlkaWEgQ29ycG9yYXRp
b24gTUNQNjUgTWVtb3J5IENvbnRyb2xsZXIgKHJldiBhMSkKMDA6MDIuMCBVU0IgQ29udHJvbGxl
cjogblZpZGlhIENvcnBvcmF0aW9uIE1DUDY1IFVTQiBDb250cm9sbGVyIChyZXYgYTMpCjAwOjAy
LjEgVVNCIENvbnRyb2xsZXI6IG5WaWRpYSBDb3Jwb3JhdGlvbiBNQ1A2NSBVU0IgQ29udHJvbGxl
ciAocmV2IGEzKQowMDowNi4wIEV0aGVybmV0IGNvbnRyb2xsZXI6IG5WaWRpYSBDb3Jwb3JhdGlv
biBNQ1A2NSBFdGhlcm5ldCAocmV2IGEzKQowMDowNy4wIEF1ZGlvIGRldmljZTogblZpZGlhIENv
cnBvcmF0aW9uIE1DUDY1IEhpZ2ggRGVmaW5pdGlvbiBBdWRpbyAocmV2IGExKQowMDowOC4wIFBD
SSBicmlkZ2U6IG5WaWRpYSBDb3Jwb3JhdGlvbiBNQ1A2NSBQQ0kgYnJpZGdlIChyZXYgYTEpCjAw
OjA5LjAgSURFIGludGVyZmFjZTogblZpZGlhIENvcnBvcmF0aW9uIE1DUDY1IElERSAocmV2IGEx
KQowMDowYS4wIElERSBpbnRlcmZhY2U6IG5WaWRpYSBDb3Jwb3JhdGlvbiBNQ1A2NSBTQVRBIENv
bnRyb2xsZXIgKHJldiBhMykKMDA6MGQuMCBQQ0kgYnJpZGdlOiBuVmlkaWEgQ29ycG9yYXRpb24g
TUNQNjUgUENJIEV4cHJlc3MgYnJpZGdlIChyZXYgYTEpCjAwOjE4LjAgSG9zdCBicmlkZ2U6IEFk
dmFuY2VkIE1pY3JvIERldmljZXMgW0FNRF0gSzggW0F0aGxvbjY0L09wdGVyb25dIEh5cGVyVHJh
bnNwb3J0IFRlY2hub2xvZ3kgQ29uZmlndXJhdGlvbgowMDoxOC4xIEhvc3QgYnJpZGdlOiBBZHZh
bmNlZCBNaWNybyBEZXZpY2VzIFtBTURdIEs4IFtBdGhsb242NC9PcHRlcm9uXSBBZGRyZXNzIE1h
cAowMDoxOC4yIEhvc3QgYnJpZGdlOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzIFtBTURdIEs4IFtB
dGhsb242NC9PcHRlcm9uXSBEUkFNIENvbnRyb2xsZXIKMDA6MTguMyBIb3N0IGJyaWRnZTogQWR2
YW5jZWQgTWljcm8gRGV2aWNlcyBbQU1EXSBLOCBbQXRobG9uNjQvT3B0ZXJvbl0gTWlzY2VsbGFu
ZW91cyBDb250cm9sCjAxOjBlLjAgRmlyZVdpcmUgKElFRUUgMTM5NCk6IFRleGFzIEluc3RydW1l
bnRzIFRTQjQzQUIyMyBJRUVFLTEzOTRhLTIwMDAgQ29udHJvbGxlciAoUEhZL0xpbmspCjAyOjAw
LjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogblZpZGlhIENvcnBvcmF0aW9uIEdlRm9yY2Ug
ODgwMCBHVCAocmV2IGEyKQo=
------=_Part_17563_12174822.1212834077871
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_17563_12174822.1212834077871--
