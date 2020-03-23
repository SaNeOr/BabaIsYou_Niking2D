#include "n2pch.h"
#include "OrthographicCamera.h"

#include <glm/gtc/matrix_transform.hpp>

namespace Niking2D {

	Niking2D::OrthographicCamera::OrthographicCamera(float left, float right, float bottom, float top)
		:m_ProjectionMatrix(glm::ortho(left, right, bottom, top, -1.0f, 1.0f)), m_ViewMatrix(1.0f), m_Position(0.0f)
	{
		m_ViewProjectionMatrix = m_ProjectionMatrix * m_ViewMatrix;
	}

	void OrthographicCamera::SetProjection(float left, float right, float bottom, float top)
	{
		N2_PROFILE_FUNCTION();

		m_ProjectionMatrix = glm::ortho(left, right, bottom, top, -1.0f, 1.0f);
		RecalculateViewMatrix();
	}

	void OrthographicCamera::RecalculateViewMatrix()
	{
		N2_PROFILE_FUNCTION();

		glm::mat4 transform = glm::translate(glm::mat4(1.0f), m_Position) *
			glm::rotate(glm::mat4(1.0f), glm::radians(m_Rotation), glm::vec3(0, 0, 1));

		m_ViewMatrix = glm::inverse(transform);	// 
		m_ViewProjectionMatrix = m_ProjectionMatrix * m_ViewMatrix;

	}
}